import 'bankingSYS.dart';
class SavingAccount extends BankAccounts {
  double interestRate;

  SavingAccount({String? name, required double balance, int? cardNumber, required this.interestRate})
      : super(name: name, balance: balance, cardNumber: cardNumber);

  void addInterest() {
    double interest = balance * (interestRate / 100);
    balance += interest;
    print("Interest added. New balance: \$${balance}");
  }
}

class NormalAccount extends BankAccounts {
  NormalAccount({String? name, required double balance, int? cardNumber})
      : super(name: name, balance: balance, cardNumber: cardNumber);
}