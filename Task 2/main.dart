import 'dart:io';

import 'functions.dart';

void main() {
  while (true) {
    print("\nChoose an option:");
    print("1. Check if a number is positive, negative, or zero");
    print("2. Calculate the sum of the first 100 natural numbers");
    print("3. Count the number of digits in an integer");
    print("4. Reverse a number");
    print("5. Calculate the power of a number");
    print("6. Simple calculator using switch...case");
    print("7. Find largest and smallest element of 3 values");
    print("8. Display even numbers from 1 to n");
    print("9. Find factorial using loops");
    print("0. Exit");

    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        Functions().checkNumber();
        break;
      case 2:
        Functions().calculateSum();
        break;
      case 3:
        Functions().countDigits();
        break;
      case 4:
        Functions().reverseNumber();
        break;
      case 5:
        Functions().calculatePower();
        break;
      case 6:
        Functions().calculate();
        break;
      case 7:
        Functions().findLargestSmallest();
        break;
      case 8:
        Functions().displayEvenNumbers();
        break;
      case 9:
        Functions().calculateFactorial();
        break;
      case 0:
        exit(0);
      default:
        print(" Wrong Entery ");
    }
  }
}
