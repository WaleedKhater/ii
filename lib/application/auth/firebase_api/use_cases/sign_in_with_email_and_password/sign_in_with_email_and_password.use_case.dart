import "package:fpdart/fpdart.dart";
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../domain/auth/contracts/i.firebase.facade.dart';
import '../../../../../domain/auth/failuers/auth.failures.dart';
import '../../../../core/use_cases/i.use_case.dart';
import '../../../../provider/auth.facade.provider.dart';
import 'sign_in_with_email_and_password.input.dart';

final firebasesignInWithEmailAndPasswordUseCaseProvider = Provider((ref) =>
    FirebaseSignInWithEmailAndPasswordUseCase(
        authFacade: ref.watch(firebaseauthFacadeProvider)));

class FirebaseSignInWithEmailAndPasswordUseCase
    implements IUseCase<FirebaseSignInWithEmailAndPasswordUseCaseInput, Unit> {
  final IFirebaseAuthFacade? _authFacade;

  FirebaseSignInWithEmailAndPasswordUseCase({IFirebaseAuthFacade? authFacade})
      : _authFacade = authFacade;

  @override
  Future<Either<FirebaseAuthFailure, Unit>> execute(input) async {
    return await _authFacade!.signInWithEmailAndPassword(
        email: input.email!, password: input.password!);
  }
}
