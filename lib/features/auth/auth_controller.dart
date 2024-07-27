import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_news/core/utils/functions.dart';
import 'package:my_news/features/auth/models/user_model.dart';
import 'package:my_news/features/auth/views/login/login_page.dart';

class AuthController with ChangeNotifier {
  AuthController({
    required this.router,
    required this.auth,
    required this.firestore,
  });

  final GoRouter router;
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

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
      showSnackBar(e.message!);
    } catch (e) {
      showSnackBar('Something went wrong');
      debugPrint(e.toString());
    } finally {
      setLoading(false);
    }
  }

  Future<void> signUp(String name, String email, String password) async {
    setLoading(true);
    try {
      final userCred = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = AppUser(
        id: userCred.user!.uid,
        name: name,
        email: email,
      );

      await firestore.collection('users').doc(user.id).set(user.toJson());

      router.go('/');
    } on FirebaseAuthException catch (e) {
      debugPrint('AUTH CONTRL: SIGN UP: $e');
      showSnackBar(e.message!);
    } catch (e) {
      debugPrint(e.toString());
      showSnackBar('Something went wrong');
    } finally {
      setLoading(false);
    }
  }

  Future<void> signOut() async {
    try {
      await auth.signOut();
      router.goNamed(LoginPage.routeName);
    } on FirebaseAuthException catch (e) {
      debugPrint('AUTH CONTRL: SIGN OUT: $e');
      showSnackBar(e.message!);
    } catch (e) {
      debugPrint(e.toString());
      showSnackBar('Something went wrong');
    }
  }
}
