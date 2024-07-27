import 'dart:io';

import 'methods.dart';

class Functions {
  // 1) Prime Number:
  void primeNumber() {
    print("Enter the number :");
    int prime = int.parse(stdin.readLineSync()!);
    if (isPrime(prime)) {
      print("$prime is a prime number");
    }
    ;
  }

  // --> (2) Print the middle index
  void middleNum() {
    print("2) Enter the string to check the middle character: ");
    String inputString = stdin.readLineSync()!;
    print("Middle character(s): ${middleCharacter(inputString)}");
  }

  //--> (3)  Print circle area
  void circleArea() {
    print("3) Enter the radius: ");
    int radius = int.tryParse(stdin.readLineSync() ?? "0") ?? 0;
    print("The area of the circle = ${areaOfCircle(radius)}");
  }

// function to count all words in a String.
  void countString() {
    print("Enter Your String:");
    String input = stdin.readLineSync()!;
    print("The number of vowels in the string is: ${countWords(input)}");
  }

  void calc() {
    print('4) Enter operation (+, -, *, /):');
    String? op = stdin.readLineSync()!;
    print(Calc(op));
  }

  void checkPass() {
    String? password;
    while (true) {
      print("Enter your password: ");
      password = stdin.readLineSync();

      if (password == null || password.isEmpty) {
        print("Invalid input. Please enter a valid password.");
        continue;
      }

      if (password.length < 8) {
        print("Password must be at least 8 characters long.");
        continue;
      }

      print("The password you entered is valid.");
      break;
    }
  }
}

