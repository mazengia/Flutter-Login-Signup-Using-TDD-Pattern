import 'package:flutter/foundation.dart';

class LoginRequest {
  final String username;
  final String password;

  LoginRequest({required this.username, required this.password});

  bool isValid() {
    if (username.isEmpty || password.isEmpty) {
      return false;
    }
    return true;
  }
}
