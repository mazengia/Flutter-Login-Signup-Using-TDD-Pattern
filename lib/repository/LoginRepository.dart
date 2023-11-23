import '../model/LoginRequest.dart';

abstract class LoginRepository {
  Future<LoginResponse> login(LoginRequest request);
}

class MockLoginRepository extends LoginRepository {
  @override
  Future<LoginResponse> login(LoginRequest request) async {
    await Future.delayed(const Duration(seconds: 1));
    if (request.username == 'johndoe' && request.password == 'password123') {
      return LoginResponse(isLoggedIn: true);
    } else {
      return LoginResponse(isLoggedIn: false, errorMessage: 'Invalid credentials');
    }
  }
}

class LoginResponse {
  final bool isLoggedIn;
  final String? errorMessage;

  LoginResponse({required this.isLoggedIn, this.errorMessage});
}
