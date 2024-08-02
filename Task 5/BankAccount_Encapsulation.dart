
class BankAccount {
  // Private property to hold the balance
  double _balance = 0;

  // Getter to read the balance
  double get balance => _balance;

// Method to deposite an amount from the balance
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print('Balance after deposit: $_balance');
    } else {
      print('Invalid deposit amount');
    }
  }

// Method to withdraw an amount from the balance
  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print('Balance after withdraw: $_balance');
    } else {
      print('Invalid withdraw amount or insufficient balance');
    }
  }
}
