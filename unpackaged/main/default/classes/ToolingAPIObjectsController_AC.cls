public with sharing Class
ToolingAPIObjectsController_AC {
  public Boolean showBlock {
    get;
    set;
  }
  public List <MyWrapper> wrapper {
    get;
    set;
  }
  public String selectedValue {
    get;
    set;
  }
  public string toolingObjectName {
    get;
    set;
  }
  public List <SelectOption>
    listOfValues = new List <SelectOption> ();
  public String cusObjId {
    get;
    set;
  }
  public List <String>
    customObjectsList {
      get;
      set;
    }
  public List <String>
    customSettingsList {
      get;
      set;
    }
  public List <String>
    customMetaDataList {
      get;
      set;
    }
  public List <String>
    standardObjectsList {
      get;
      set;
    }
  public List <String>
    customFieldNameList {
      get;
      set;
    }

  public ToolingApiObjectsController_AC() {
    customObjectsList =
      new List <String> ();
    standardObjectsList =
      new List <String> ();
    customSettingsList =
      new List <String> ();
    customMetaDataList =
      new List <String> ();
    for (Schema.SObjectType objTyp:
      Schema.getGlobalDescribe().Values()) {

      if (objTyp.getDescribe().isCustom() && !objTyp.getDescribe().getName().contains('__mdt'))

      {
        customObjectsList.add(objTyp.getDescribe().getLabel());
      }
      if (objTyp.getDescribe().isCustomSetting()) {
        customSettingsList.add(objTyp.getDescribe().getLabel());
      }
      if (objTyp.getDescribe().getName().contains('__mdt')) {
        customMetaDataList.add(objTyp.getDescribe().getLabel());
      }
      if (!objTyp.getDescribe().getName().contains('__')) {
        standardObjectsList.add(objTyp.getDescribe().getName());
      }
    }
  }

  public List <SelectOption>
    getlistOfValues() {
      listOfValues.clear();
      if (toolingObjectName == 'CustomObjects') {
        for (String customObj:customObjectsList) {
          listOfValues.add(new SelectOption(customObj, customObj));
        }
      } else if (toolingObjectName =='StandardObjects') {
        for (String standardObj:standardObjectsList) {
          listOfValues.add(new SelectOption(standardObj,standardObj));
        }
      } else if (toolingObjectName =='CustomSettings') {
        for (String cusset:customSettingsList) {
          listOfValues.add(new SelectOption(cusset, cusset));
        }
      } else if (toolingObjectName == 'CustomMetaData') {
        for (String cusmetdata: customMetaDataList) {
          listOfValues.add(new SelectOption(cusmetdata, cusmetdata));
        }
      }
        else if (toolingObjectName == 'ValidationRule') {
        for (String cusmetdata: customMetaDataList) {
          listOfValues.add(new SelectOption(cusmetdata, cusmetdata));
        }
      }
      return listOfValues;
    }

  public void getListOfObjects() {
    if (selectedValue != null) {
      String endpoint, baseURL =  URL.getSalesforceBaseUrl().toExternalForm();
      showBlock = True;
      if (selectedValue.contains(' ')) {
        selectedValue = selectedValue.Replace(' ', '_');
      }
      if (toolingObjectName == 'CustomObjects' && selectedValue != NULL) {
        endpoint = baseURL + '/services/data/v38.0/tooling/query/?q=SELECT+Id+FROM+CustomObject+WHERE+DeveloperName = \'' + selectedValue + '\'';
        getListOfCustomField(endpoint);
        if (cusObjId != NULL) {
          endpoint = baseURL + '/services/data/v38.0/tooling/query/?q=SELECT+Id,DeveloperName+FROM+CustomField+WHERE+TableEnumORId = \'' + cusObjId +'\'';
          getListOfCustomField(endpoint);
        }
      } else {
        endpoint = baseURL + '/services/data/v38.0/tooling/query/?q=SELECT+Id,DeveloperName+FROM+CustomField+WHERE+TableEnumORId = \''+ selectedValue + '\'';
        getListOfCustomField(endpoint);
      }
    }
  }

  public class MyWrapper {
    public String customFieldName {
      get;
      set;
    }
    public String customFieldId {
      get;
      set;
    }
    public MyWrapper(String name, String id) {
      customFieldId = id;
      customFieldName = name;
    }
  }
  public void reset() {
    showBlock = False;
    selectedValue = '';
    if (listOfValues != null) {
      listOfValues.clear();
    }
  }

  public void getListOfCustomField (String endpoint) {

      List <String> customFieldIdList;
      String response;
      HttpRequest req = new HttpRequest();
      req.setHeader('Authorization','Bearer' + UserInfo.getSessionID());
      req.setHeader('Content-Type', 'application/json');
      req.setEndpoint(endpoint);
      req.setMethod('GET');
      Http h = new Http();
      HttpResponse res = h.send(req);
      response = res.getBody();
      system.debug(response);
      if (response.contains('"entityTypeName":"CustomObject"')) {
        JSONParser parser = JSON.createParser(response);
        customFieldNameList = new List <String> ();
        customFieldIdList = new List <String> ();
        while (parser.nextToken() != null) {
          if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && ((parser.getText() == 'Id'))) {
            parser.nextToken();
            cusObjId = (parser.getText());
          }
        }
      } else {
        JSONParser parser = JSON.createParser(response);
        customFieldNameList = new List <String> ();
        customFieldIdList = new List <String> ();
        while (parser.nextToken() != null) {
          if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && ((parser.getText() == 'DeveloperName'))) {
            parser.nextToken();
            customFieldNameList.add(parser.getText());
          }
          if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) &&  (parser.getText() == 'Id')) {
            parser.nextToken();
            customFieldIdList.add(parser.getText());
          }
        }

        wrapper = new List <MyWrapper> ();
        for (Integer i = 0; i<customFieldNameList.size(); i++)
          wrapper.add(new MyWrapper(customFieldNameList[i],
            customFieldIdList[i]));
        //if (customFieldNameList.size() == 0) {
        //  ApexPages.Message myMessage = new ApexPages.Message(ApexPages.Severity.Info,'Info: There is no Custom Field for this Object.');  
         //   ApexPages.addMessage(myMessage); showBlock = False;
         // }
        }
      }
    }