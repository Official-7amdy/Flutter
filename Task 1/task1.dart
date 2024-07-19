import 'dart:io';

void main() {
  print("Enter the number of the operation needed:\n"
      "1. Remove White Spaces from a String\n"
      "2. Round a Number\n"
      "3. Capitalize a String\n"
      "4. Check if a String Contains a Substring\n"
      "5. Calculate Union and Intersection of Two Sets\n"
      "6. Calculate the Sum and Average of a list\n"
      "7. calculate circle perimeter and area.");
  String? a = stdin.readLineSync()!;

  switch (a) {
    case "1":
      // Code To Remove All White Spaces From String.
      print("Enter A String");
      String input = stdin.readLineSync()!;
      String result = input.replaceAll(' ', '').trim();
      print("String without white spaces: $result");
      break;

    case "2":
      // Code To  Round A Number.
      print("Enter The Number You need to round");
      double round = double.parse(stdin.readLineSync()!);
      double rounded = round.roundToDouble();
      print("Rounded Number: $rounded");
      break;

    case "3":
      // Code To  Capetalize the first character in a string.
      print("Enter A String");
      String cap = stdin.readLineSync()!;
      String result = cap[0].toUpperCase() + cap.substring(1);
      print(result);
      break;

    case "5":
      // Code To  calculate union and intersection of two sets.
      print("Enter The First Set (elements separated by spaces):");
      Set<String> set1 = stdin.readLineSync()!.split(' ').toSet();

      print("Enter The Second Set (elements separated by spaces):");
      Set<String> set2 = stdin.readLineSync()!.split(' ').toSet();

      print("Union of the two sets: ${set1.union(set2)}");
      print("Intersection of the two sets: ${set1.intersection(set2)}");
      break;

    case "6":
      // Code To  calculate the sum and average of a list.
      List<int> numbers = [5, 6, 8, 9, 2];

      int total = 0;

      double average = total / numbers.length;
      for (int i = 0; i < numbers.length; i++) {
        total += numbers[i];
      }

      print('The total is : $total');
      print('The Avg is : ${average}');
      break;

    case "7":
      // Code To  calculate circle perimeter and area.
      print("Enter The Radius of the Circle");
      const pi = 3.14;
      double radius = double.parse(stdin.readLineSync()!);
      double perimeter = 2 * pi * radius;
      double area = pi * radius * radius;
      print("Perimeter of the Circle: $perimeter");
      print("Area of the Circle: $area");
      break;

    case "4":
      // Code to check susbstring.
      print("Enter the main string:");
      String mainString = stdin.readLineSync()!;

      print("Enter the substring to check:");
      String substring = stdin.readLineSync()!;

      if (mainString.contains(substring)) {
        print("The main string contains the substring.");
      } else {
        print("The main string does not contain the substring.");
      }
      break;
  }
}
