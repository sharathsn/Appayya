trigger processEvent on My_Event__e (after insert) {
List<Account> accList = [select id from account where id =:trigger.new[0].id];
system.assertequals(accList.size(),1);
}