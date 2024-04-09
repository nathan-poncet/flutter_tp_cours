import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp_cours/src/constants/app_sizes.dart';
import 'package:tp_cours/src/constants/paddings.dart';
import 'package:tp_cours/src/features/auth/presentation/auth_sign_in_form_validators.dart';
import 'package:tp_cours/src/features/auth/repository/auth_repository.dart';

class AuthSignInForm extends StatefulWidget {
  const AuthSignInForm({super.key});

  @override
  State<AuthSignInForm> createState() => _AuthSignInFormState();
}

class _AuthSignInFormState extends State<AuthSignInForm> with AuthSignInFormValidators {
  final _node = FocusScopeNode();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _submitted = false;
  String? _error;

  String get email => _emailController.text;
  String get password => _passwordController.text;

  void _emailEditingComplete() {
    if (canSubmitEmail(email)) {
      _node.nextFocus();
    }
  }

  void _passwordEditingComplete() {
    if (!canSubmitEmail(email)) {
      _node.previousFocus();
      return;
    }
    _submit();
  }

  Future<bool> _submit() async {
    setState(() => _submitted = true);
    if (_formKey.currentState?.validate() ?? false) {
      try {
        final res = await context.read<AuthRepositoryProvider>().login(email, password);

        if (res == null) {
          setState(() => _error = 'Invalid credentials');
          return false;
        }

        return true;
      } catch (e) {
        setState(() => _error = e.toString());
      }
    }
    return true;
  }

  @override
  void dispose() {
    _node.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Paddings.page,
      child: FocusScope(
        node: _node,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                validator: (email) => !_submitted ? null : emailErrorText(email ?? ''),
                onEditingComplete: () => _emailEditingComplete(),
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                validator: (password) => !_submitted ? null : passwordErrorText(password ?? ''),
                onEditingComplete: () => _passwordEditingComplete(),
              ),
              gapH32,
              if (_error != null) ...[
                Center(child: Text(_error!, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.error))),
                gapH32,
              ],
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Connexion'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
