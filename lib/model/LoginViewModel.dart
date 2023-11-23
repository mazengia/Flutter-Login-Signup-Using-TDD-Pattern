import 'package:flutter/foundation.dart';

import '../repository/LoginRepository.dart';
import 'LoginRequest.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginRepository _repository;

  LoginViewModel(this._repository);

  String _username = '';
  String get username => _username;
  set username(String value) {
    _username = value;
    notifyListeners();
  }

  String _password = '';
  String get password => _password;
  set password(String value) {
    _password = value;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  set errorMessage(String? value) {
    _errorMessage = value;
    notifyListeners();
  }

  Future<void> login() async {
    if (_username.isEmpty || _password.isEmpty) {
      errorMessage = 'Please enter username and password';
      return;
    }

    try {
      isLoading = true;

      final request = LoginRequest(username: _username, password: _password);
      final response = await _repository.login(request);

      if (response.isLoggedIn) {
        // Navigate to home screen
      } else {
        errorMessage = response.errorMessage;
      }
    } catch (e) {
      errorMessage = 'An error occurred while logging in';
    } finally {
      isLoading = false;
    }
  }

}
