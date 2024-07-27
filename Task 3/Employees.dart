import 'dart:io';

class emp {
  String? name;
  String? jobTitle;
  String? department;
  double? salary;


  void  empSearch(){
  print("Enter the name of the employee: ");
  this.name = stdin.readLineSync()!;
  print("Enter the job title of the employee: ");
  this.jobTitle = stdin.readLineSync()!;
  print("Enter the department of the employee: ");
  this.department = stdin.readLineSync()!;
  print("Enter the salary of the employee: ");
  this.salary = double.parse(stdin.readLineSync()!);
  
   print('Name: $name');
    print('Job Title: $jobTitle');
    print('Salary: $salary');
}

  

}
