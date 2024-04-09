import 'package:flutter/material.dart';
import 'package:tp_cours/src/features/auth/data/user.dart';

class AuthRepositoryProvider with ChangeNotifier {
  final List<User?> _users = [
    User(
      id: '1',
      name: 'John Doe',
      email: 'johndoe@gmail.com',
      password: 'password',
    ),
    User(
      id: '2',
      name: 'Jane Doe',
      email: 'janedoe@gmail.com',
      password: 'password',
    ),
  ];

  User? _user = User(
    id: '2',
    name: 'Jane Doe',
    email: 'janedoe@gmail.com',
    password: 'password',
  );

  User? get user => _user;

  Future<User?> login(String email, String password) async {
    _user = _users.firstWhere(
      (user) => user?.email == email && user?.password == password,
      orElse: () => null,
    );

    if (_user == null) {
      throw Exception('Invalid credentials');
    }

    notifyListeners();

    return _user;
  }

  Future<void> logout() async {
    _user = null;
    notifyListeners();
  }

  Future<User?> register(String name, String email, String password) async {
    final newUser = User(
      id: _users.length.toString(),
      name: name,
      email: email,
      password: password,
    );

    _users.add(newUser);
    _user = newUser;

    notifyListeners();

    return _user;
  }
}
