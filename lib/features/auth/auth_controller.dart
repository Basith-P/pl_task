import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthController with ChangeNotifier {
  AuthController({required this.router, required this.auth});

  final GoRouter router;
  final FirebaseAuth auth;

  bool isLoading = false;

  // ignore: avoid_positional_boolean_parameters
  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> signIn(String email, String password) async {
    setLoading(true);
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      router.go('/');
    } on FirebaseAuthException catch (e) {
      debugPrint('AUTH CONTRL: SIGN IN: $e');
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setLoading(false);
    }
  }

  Future<void> signUp(String name, String email, String password) async {
    setLoading(true);
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      router.go('/');
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setLoading(false);
    }
  }
}
