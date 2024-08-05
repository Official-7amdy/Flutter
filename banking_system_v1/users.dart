import 'bankingSYS.dart';

class User {
  String name;
  List<BankAccounts> accounts = [];

  User({required this.name});

  void addAccount(BankAccounts account) {
    accounts.add(account);
  }

  BankAccounts? getAccount(int cardNumber) {
    for (var account in accounts) {
      if (account.cardNum == cardNumber) {
        return account;
      }
    }
    return null;
  }
}

