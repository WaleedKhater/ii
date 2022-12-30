import 'package:fpdart/fpdart.dart';
import 'package:iattened/domain/auth/failuers/auth.failures.dart';

abstract class IFirebaseAuthFacade{
  Future<Either<FirebaseAuthFailure,Unit>>signInWithEmailAndPassword({
    String? email,String? password
  });
    Future<Either<FirebaseAuthFailure,String>>signUpWithEmailAndPassword({
    String? email,String? password
  });
  Future<void>signout();
  Stream<String> get currentUserStream;
}