import 'package:fixlora/Services/auth_service.dart';
import 'package:flutter/material.dart';

enum AuthStatus { idle, loading, success, error }

class AuthProvider extends ChangeNotifier {
  final AuthService _service = AuthService();

  AuthStatus status = AuthStatus.idle;
  String? errorMessage;

  // ── SignUp ────────────────────────────────
  Future<void> signUp({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    _setLoading();
    try {
      await _service.signUp(
        name: name,
        email: email,
        phone: phone,
        password: password,
      );
      _setSuccess();
    } catch (e) {
      _setError(e.toString());
    }
  }

  // ── Login ─────────────────────────────────
  Future<void> login({required String email, required String password}) async {
    _setLoading();
    try {
      await _service.login(email: email, password: password);
      _setSuccess();
    } catch (e) {
      _setError(e.toString());
    }
  }

  // ── Reset ─────────────────────────────────
  void reset() {
    status = AuthStatus.idle;
    errorMessage = null;
    notifyListeners();
  }

  // ── Private Helpers ───────────────────────
  void _setLoading() {
    status = AuthStatus.loading;
    errorMessage = null;
    notifyListeners();
  }

  void _setSuccess() {
    status = AuthStatus.success;
    notifyListeners();
  }

  void _setError(String e) {
    status = AuthStatus.error;
    errorMessage = _parseError(e);
    notifyListeners();
  }

  String _parseError(String e) {
    if (e.contains('email-already-in-use')) return 'Email already registered';
    if (e.contains('weak-password')) return 'Password is too weak';
    if (e.contains('user-not-found')) return 'No account found';
    if (e.contains('wrong-password')) return 'Wrong password';
    if (e.contains('invalid-credential')) return 'Invalid email or password';
    if (e.contains('network-request-failed')) return 'No internet connection';
    return 'Something went wrong';
  }
}
