import "package:firebase_database/firebase_database.dart";
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseDatabase _db = FirebaseDatabase.instance;

  // ── Sign Up ───────────────────────────────
  Future<void> signUp({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    UserCredential cred = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await _db.ref('users/${cred.user!.uid}').set({
      'uid': cred.user!.uid,
      'name': name,
      'email': email,
      'phone': phone,
      'role': 'customer',
      'createdAt': DateTime.now().toIso8601String(),
    });
  }

  // ── Login ─────────────────────────────────
  Future<void> login({required String email, required String password}) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }
}
