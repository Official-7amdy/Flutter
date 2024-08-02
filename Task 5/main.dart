import 'dart:io';

import 'BankAccount_Encapsulation.dart';
import 'shape_inheritance.dart';

void main() {
  while (true) {
    print("\nChoose an option:");
    print("1. Bank Account");
    print("2. Shape");

    print("0. Exit");
    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1: // Create a new bank account instance
        BankAccount account = BankAccount();

        // Get deposit amount from user
        print('Enter amount of deposit: ');
        double depositAmount = double.parse(stdin.readLineSync()!);
        account.deposit(depositAmount);

        // Get withdraw amount from user
        print('Enter amount of withdraw: ');
        double withdrawAmount = double.parse(stdin.readLineSync()!);
        account.withdraw(withdrawAmount);
        break;

      case 2:
        while (true) {
          print("\nChoose an option:");
          print("1. Rectangle Area");
          print("2. Triangle Area");

          print("0. Exit");
          int ShapeChoice = int.parse(stdin.readLineSync()!);

          switch (ShapeChoice) {
            case 1:
              // Get input for Rectangle
              print('Enter width of the rectangle: ');
              double width = double.parse(stdin.readLineSync()!);

              print('Enter height of the rectangle: ');
              double height = double.parse(stdin.readLineSync()!);

              // Create a Rectangle object and calculate its area
              Rectangle rect = Rectangle(width, height);
              print('Area of Rectangle: ${rect.area()}');

            case 2:

              // Get input for Triangle
              print('Enter base of the triangle: ');
              double base = double.parse(stdin.readLineSync()!);

              print('Enter height of the triangle: ');
              double triangleHeight = double.parse(stdin.readLineSync()!);

              // Create a Triangle object and calculate its area
              Triangle tri = Triangle(base, triangleHeight);
              print('Area of Triangle: ${tri.area()}');

            case 0:
              exit(0);
            default:
              print(" Wrong Entery ");
          }
        }
      case 0:
        exit(0);
      default:
        print(" Wrong Entery ");
    }
  }
}
