import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp_cours/src/features/auth/presentation/auth_sign_in_form.dart';
import 'package:tp_cours/src/features/auth/presentation/auth_sign_up_form.dart';
import 'package:tp_cours/src/features/auth/repository/auth_repository.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const tabs = [
      Tab(text: "Connexion"),
      Tab(text: "Inscription"),
    ];

    final user = context.watch<AuthRepositoryProvider>().user;

    if (user != null) {
      Navigator.of(context).pop();
    }

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: tabs,
          ),
        ),
        body: const TabBarView(
          children: [
            AuthSignInForm(),
            AuthSignUpForm(),
          ],
        ),
      ),
    );
  }
}
