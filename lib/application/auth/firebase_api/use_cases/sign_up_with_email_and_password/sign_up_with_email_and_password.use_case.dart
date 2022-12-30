import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iattened/application/user/usecase/create_user_use_case.dart';
import '../../../../../domain/auth/contracts/i.firebase.facade.dart';
import '../../../../../domain/core/i.failure.dart';
import '../../../../core/use_cases/i.use_case.dart';
import '../../../../provider/auth.facade.provider.dart';
import 'sign_up_with_email_and_password.input.dart';

final firebasesignUpWithEmailAndPasswordUseCaseProvider = Provider((ref) =>
    SignUpWithEmailAndPasswordUseCase(
        authFacade: ref.watch(firebaseauthFacadeProvider), read: ref));

class SignUpWithEmailAndPasswordUseCase
    implements IUseCase<FirebaseSignUpWithEmailAndPasswordUseCaseInput, Unit> {
  final IFirebaseAuthFacade? _authFacade;
  final Ref? _read;

  SignUpWithEmailAndPasswordUseCase(
      {IFirebaseAuthFacade? authFacade, Ref? read})
      : _authFacade = authFacade,
        _read = read;

  @override
  Future<Either<IFailure, Unit>> execute(input) async {
    final result = await _authFacade!.signUpWithEmailAndPassword(
        email: input.user!.email!, password: input.password!);
    return result.fold(
      (failure) => left(failure),
      (uid) => _read!
          .read(createDoctorCaseProvider)
          .execute(input.user!.copyWith(id: uid)),
    );
  }
}
