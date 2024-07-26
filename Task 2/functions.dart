import 'dart:io';

class Functions {
  void checkNumber() {
    print("Enter a number: ");
    int number = int.parse(stdin.readLineSync()!);
    if (number > 0) {
      print("$number is positive.");
    } else if (number < 0) {
      print("$number is negative.");
    } else {
      print("$number is zero.");
    }
  }


  void calculateSum() {
    int sum = 0;
    for (int i = 1; i <= 100; i++) {
      sum += i;
    }
    print("The sum of the first 100 natural numbers is: $sum");
  }


  void countDigits() {
    print("Input the number: ");
    int number = int.parse(stdin.readLineSync()!);
    int count = 0;

    int temp = number;
    while (temp != 0) {
      temp ~/= 10;
      count++;
    }

    print("The Number of digits is: $count");
  }


  void reverseNumber() {
    print("Enter a number: ");
    int number = int.parse(stdin.readLineSync()!);
    int reversedNumber = 0;

    while (number != 0) {
      int digit = number % 10;
      reversedNumber = reversedNumber * 10 + digit;
      number ~/= 10;
    }

    print("Reversed Number is: $reversedNumber");
  }


  void calculatePower() {
    print("Enter the base number: ");
    int base = int.parse(stdin.readLineSync()!);

    print("Enter the exponent: ");
    int exponent = int.parse(stdin.readLineSync()!);

    int result = 1;

    for (int i = 0; i < exponent; i++) {
      result *= base;
    }

    print("$base raised to the power of $exponent is: $result");
  }


  void calculate() {
    print("Enter first number: ");
    double num1 = double.parse(stdin.readLineSync()!);

    print("Enter second number: ");
    double num2 = double.parse(stdin.readLineSync()!);

    print("Enter an operator (+, -, *, /): ");
    String operator = stdin.readLineSync()!;

    double result;

    switch (operator) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case '*':
        result = num1 * num2;
        break;
      case '/':
        result = num1 / num2;
        break;
      default:
        print("Invalid operator");
        return;
    }

    print("The result is: $result");
  }


  void findLargestSmallest() {
    print("Enter first number: ");
    int a = int.parse(stdin.readLineSync()!);

    print("Enter second number: ");
    int b = int.parse(stdin.readLineSync()!);

    print("Enter third number: ");
    int c = int.parse(stdin.readLineSync()!);

    int largest = a;
    int smallest = a;

    if (b > largest) largest = b;
    if (c > largest) largest = c;

    if (b < smallest) smallest = b;
    if (c < smallest) smallest = c;

    print("Largest number is: $largest");
    print("Smallest number is: $smallest");
  }


  void displayEvenNumbers() {
    print("Enter the value of n: ");
    int n = int.parse(stdin.readLineSync()!);

    for (int i = 1; i <= n; i++) {
      if (i % 2 == 0) {
        print(i);
      }
    }
  }


  void calculateFactorial() {
    print("Input the number: ");
    int number = int.parse(stdin.readLineSync()!);
    int factorial = 1;

    for (int i = 1; i <= number; i++) {
      factorial *= i;
    }

    print("The Factorial of $number is: $factorial");
  }
}
