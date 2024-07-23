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
        NumberCheck().checkNumber();
        break;
      case 2:
        SumOfNumbers().calculateSum();
        break;
      case 3:
        DigitCounter().countDigits();
        break;
      case 4:
        NumberReverser().reverseNumber();
        break;
      case 5:
        PowerCalculator().calculatePower();
        break;
      case 6:
        SimpleCalculator().calculate();
        break;
      case 7:
        LargestSmallestFinder().findLargestSmallest();
        break;
      case 8:
        EvenNumbers().displayEvenNumbers();
        break;
      case 9:
        FactorialCalculator().calculateFactorial();
        break;
      case 0:
        exit(0);
      default:
        print(" Wrong Entery ");
    }
  }
}