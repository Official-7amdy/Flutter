import 'accountTypes.dart';
import 'users.dart';

List<User> setupUsers() {
  // Create a list to store users
  List<User> users = [];

  // Create and add user details manually

  // User 1
  User user1 = User(name: 'Ahmed Hamdy');
  SavingAccount savingAccount1 = SavingAccount(
    name: 'Ahmed Hamdy',
    balance: 1000.0,
    cardNumber: 123456,
    interestRate: 2.5,
  );
  NormalAccount normalAccount1 = NormalAccount(
    name: 'Ahmed Hamdy',
    balance: 500.0,
    cardNumber: 654321,
  );
  user1.addAccount(savingAccount1);
  user1.addAccount(normalAccount1);
  users.add(user1);

  // User 2
  User user2 = User(name: 'Mohamed Hamdy');
  SavingAccount savingAccount2 = SavingAccount(
    name: 'Mohamed Hamdy',
    balance: 2000.0,
    cardNumber: 234567,
    interestRate: 3.0,
  );
  NormalAccount normalAccount2 = NormalAccount(
    name: 'Mohamed Hamdy',
    balance: 1500.0,
    cardNumber: 765432,
  );
  user2.addAccount(savingAccount2);
  user2.addAccount(normalAccount2);
  users.add(user2);


  return users;
}
