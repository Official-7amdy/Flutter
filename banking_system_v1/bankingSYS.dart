
import 'accountTypes.dart';

class BankAccounts {
  int? _cardNumber;
  String? name;
  late double balance;

  BankAccounts({this.name, required this.balance, int? cardNumber}) {
    _cardNumber = cardNumber;
  }

  int? get cardNum => _cardNumber;

  void deposit(double amount) {
  if (amount > 0) {
    balance += amount;
    print("Deposit successful. New balance: \$${balance}");
  } else {
    print("Invalid deposit amount.");
  }
}

void withdraw(double amount) {
  if (amount > 0 && amount <= balance) {
    balance -= amount;
    print("Withdrawal successful. New balance: \$${balance}");
  } else {
    print("Invalid withdrawal amount or insufficient balance.");
  }
}


 void transfer(double amount, BankAccounts recipient) {
  if (amount > 0 && amount <= balance) {
    balance -= amount;
    recipient.balance += amount;
    print("Transfer successful. Your new balance: \$${balance}");
    print("Recipient's new balance: \$${recipient.balance}");
  } else {
    print("Invalid transfer amount or insufficient balance.");
  }
}


  void checkBalance() {
    print("Account balance: \$${balance}");
  }

  void displayAccountDetails() {
  print("Account Holder: $name");
  print("Card Number: $_cardNumber");
  print("Current Balance: \$${balance}");

  if (this is SavingAccount) {
    SavingAccount savingAccount = this as SavingAccount;
    print("Interest Rate: ${savingAccount.interestRate}%");
  }
}

}
