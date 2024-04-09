import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp_cours/src/constants/app_sizes.dart';
import 'package:tp_cours/src/constants/paddings.dart';
import 'package:tp_cours/src/features/auth/repository/auth_repository.dart';

class AuthAccountScreen extends StatelessWidget {
  const AuthAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthRepositoryProvider>().user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon compte'),
      ),
      body: Padding(
        padding: Paddings.page,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nom: ${user?.name}'),
            gapH24,
            Text('Email: ${user?.email}'),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: Paddings.page,
        child: ElevatedButton(
          onPressed: () {
            context.read<AuthRepositoryProvider>().logout();
            Navigator.of(context).pop();
          },
          child: const Text('Déconnexion'),
        ),
      ),
    );
  }
}
