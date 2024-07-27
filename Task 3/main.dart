import 'dart:io';

import 'Employees.dart';
import 'functions.dart';

void main() {
  while (true) {
    print("\nChoose an option:");
    print("1. Check if a number is prime or not");
    print("2. Find the middle numbers");
    print("3. Find the circle area");
    print("4. count all words in a String");
    print("5. Simple calculator");
    print("6. Simple calculator using switch...case");
    print("7. Find largest and smallest element of 3 values");
    print("8. Display even numbers from 1 to n");
    print("9. Find factorial using loops");
    print("0. Exit");

    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        Functions().primeNumber();
        break;
      case 2:
        Functions().middleNum();
        break;
      case 3:
        Functions().circleArea();
        break;
      case 4:
        Functions().countString();
        break;
      case 5:
        Functions().calc();
        break;
      case 6:
        Functions().checkPass();
        break;
      case 7:
       emp().empSearch();
        break;
      case 0:
        exit(0);
      default:
        print(" Wrong Entery ");
    }
  }
}
