import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:iattened/domain/auth/contracts/i.firebase.facade.dart';
import 'package:iattened/domain/auth/failuers/auth.failures.dart';

class FirebaseAuthFacade implements IFirebaseAuthFacade {
  final _auth = FirebaseAuth.instance;
  static const String inValidPassword = "wrong-password";
  static const String inValidEmail = "user-not-found";
  static const String inUse = "email-already-in-use";
  static const String servererror = "server-error";
  @override
  Stream<String> get currentUserStream {
    return _auth.authStateChanges().map((user) => user!.uid);
  }

  @override
  Future<Either<FirebaseAuthFailure, Unit>> signInWithEmailAndPassword(
      {String? email, String? password}) async {
    late Box setting;
    try {
      await _auth.signInWithEmailAndPassword(
          email: email!, password: password!);
      setting = Hive.box("setting");
      await setting.put("login", true);
      return right(unit);
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case inUse:
          return left(const FirebaseAuthFailure.emailAlreadyInUse());
        case inValidPassword:
          return left(const FirebaseAuthFailure.invalidPassword());
        case servererror:
          return left(const FirebaseAuthFailure.serverError());
        case inValidEmail:
          return left(const FirebaseAuthFailure.invalidEmail());
        default:
          return left(const FirebaseAuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<FirebaseAuthFailure, String>> signUpWithEmailAndPassword(
      {String? email, String? password}) async {
    late Box setting;
    try {
      final credentails = await _auth.createUserWithEmailAndPassword(
          email: email!, password: password!);
      setting = Hive.box("setting");
      await setting.put("login", true);
      return right(credentails.user!.uid);
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case inUse:
          return left(const FirebaseAuthFailure.emailAlreadyInUse());
        case servererror:
          return left(const FirebaseAuthFailure.serverError());
        default:
          return left(const FirebaseAuthFailure.emailAlreadyInUse());
      }
    }
  }

  @override
  Future<void> signout() async {
    late Box setting;
    setting = Hive.box("setting");
    await setting.delete("login");
    return await _auth.signOut();
  }
}
