@isTest
public class EmployeeTests {
    @isTest
    static void testEmployeeConstructor() {
        // Arrange
        String name = 'John'; 
        Integer age = 30;
        Integer salary = 5000;
        String depName = 'IT';

        // Act
        Employee employee = new Employee(name, age, salary, depName);

        // Assert
        System.assertEquals(name, employee.name);
        System.assertEquals(age, employee.age);
        System.assertEquals(salary, employee.objDept.salary);
        System.assertEquals(depName, employee.objDept.depName);
    }
}