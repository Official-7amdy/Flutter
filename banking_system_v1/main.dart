import 'dart:io';
import 'accounts.dart';
import 'bankingSYS.dart';
import 'users.dart';

void main() {
  List<User> users = setupUsers(); // Get the list of users

  while (true) {
    print("\nChoose an option:");
    print("1. Deposit");
    print("2. Withdraw");
    print("3. Transfer");
    print("4. Check Balance");
    print("5. Display Account Details");
    print("6. Display All User Details");
    print("7. Exit");
    String? choice = stdin.readLineSync();

    try {
      switch (choice) {
        case '1': // Deposit
          print("Enter your card number:");
          int cardNumber = int.parse(stdin.readLineSync()!);
          User user = users.firstWhere(
            (user) => user.getAccount(cardNumber) != null,
            orElse: () => throw Exception("Account not found.")
          );
          BankAccounts account = user.getAccount(cardNumber)!;
          print("Enter deposit amount:");
          double amount = double.parse(stdin.readLineSync()!);
          account.deposit(amount);
          break;

        case '2': // Withdraw
          print("Enter your card number:");
          int cardNumber = int.parse(stdin.readLineSync()!);
          User user = users.firstWhere(
            (user) => user.getAccount(cardNumber) != null,
            orElse: () => throw Exception("Account not found.")
          );
          BankAccounts account = user.getAccount(cardNumber)!;
          print("Enter withdrawal amount:");
          double amount = double.parse(stdin.readLineSync()!);
          account.withdraw(amount);
          break;

        case '3': // Transfer
          print("Enter your card number:");
          int senderCardNumber = int.parse(stdin.readLineSync()!);
          User senderUser = users.firstWhere(
            (user) => user.getAccount(senderCardNumber) != null,
            orElse: () => throw Exception("Sender account not found.")
          );
          BankAccounts senderAccount = senderUser.getAccount(senderCardNumber)!;

          print("Enter recipient's card number:");
          int recipientCardNumber = int.parse(stdin.readLineSync()!);
          BankAccounts recipientAccount = users.expand((user) => user.accounts).firstWhere(
            (account) => account.cardNum == recipientCardNumber,
            orElse: () => throw Exception("Recipient account not found.")
          );

          print("Enter transfer amount:");
          double amount = double.parse(stdin.readLineSync()!);
          senderAccount.transfer(amount, recipientAccount);
          break;

        case '4': // Check Balance
          print("Enter your card number:");
          int cardNumber = int.parse(stdin.readLineSync()!);
          User user = users.firstWhere(
            (user) => user.getAccount(cardNumber) != null,
            orElse: () => throw Exception("Account not found.")
          );
          BankAccounts account = user.getAccount(cardNumber)!;
          account.checkBalance();
          break;

        case '5': // Display Account Details
          print("Enter your card number:");
          int cardNumber = int.parse(stdin.readLineSync()!);
          User user = users.firstWhere(
            (user) => user.getAccount(cardNumber) != null,
            orElse: () => throw Exception("Account not found.")
          );
          BankAccounts account = user.getAccount(cardNumber)!;
          account.displayAccountDetails();
          break;

        case '6': // Display All User Details
          for (var user in users) {
            print("\nUser: ${user.name}");
            for (var account in user.accounts) {
              account.displayAccountDetails();
            }
          }
          break;

        case '7': // Exit
          print("Exiting the system. Goodbye!");
          return;

        default:
          print("Invalid option. Please try again.");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
