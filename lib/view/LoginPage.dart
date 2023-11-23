import 'package:flutter/material.dart';

import '../model/LoginViewModel.dart';
import '../repository/LoginRepository.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _viewModel = LoginViewModel(MockLoginRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Username'),
              onChanged: (value) => _viewModel.username = value,
            ),
            const SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
              onChanged: (value) => _viewModel.password = value,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _viewModel.login,
              child: const Text('Login'),
            ),
            if (_viewModel.isLoading)
              const CircularProgressIndicator(),
            if (_viewModel.errorMessage != null)
              Text(_viewModel.errorMessage!),
          ],
        ),
      ),
    );
  }
}
