// 1) Prime Number:
import 'dart:io';

bool isPrime(int x) {
  if (x < 2) return false;
  for (int i = 2; i <= x ~/ i; i++) {
    if (x % i == 0) return false;
  }
  return true;
}

// 2) Display the middle character:
String middleCharacter(String s) {
  int length = s.length;
  if (length % 2 == 0) {
    int mid = length ~/ 2;
    return s[mid - 1] + s[mid];
  } else {
    int mid = length ~/ 2;
    return s[mid];
  }
}

// 3) Function to find the area of a circle:
double areaOfCircle(int r) {
  double area = 3.14 * r * r;
  return area;
}

// 4) Function to count all words in a String:
int countWords(String str) {
  List<String> words = str.split(' ');
  return words.length;
}

// 5) Simple Calculator Using Functions and Switch case:
String Calc(String? operation) {
  print("Enter the first number: ");
  int? num1 = int.tryParse(stdin.readLineSync()!);
  print("Enter the second number: ");
  int? num2 = int.tryParse(stdin.readLineSync()!);

  if (num1 == null || num2 == null) {
    return "Invalid input. Please enter valid numbers.";
  }

  dynamic result;
  switch (operation) {
    case "+":
      result = num1 + num2;
      break;
    case "-":
      result = num1 - num2;
      break;
    case "*":
      result = num1 * num2;
      break;
    case "/":
      if (num2 == 0) {
        return "Division by zero is not allowed.";
      }
      result = num1 / num2;
      break;
    default:
      return "Invalid operation.";
  }

  return "The result is: $result";
}

