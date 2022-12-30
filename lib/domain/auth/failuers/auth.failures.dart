import 'package:iattened/domain/core/i.failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth.failures.freezed.dart';

@freezed 
abstract class FirebaseAuthFailure with _$FirebaseAuthFailure implements IFailure{
  const factory FirebaseAuthFailure.emailAlreadyInUse() = _EmailAlreadyInUse;
  const factory FirebaseAuthFailure.invalidEmail() = _InvalidEmail;
  const factory FirebaseAuthFailure.invalidPassword() = _InvalidPassword;
  const factory FirebaseAuthFailure.serverError() = _ServerError;
}