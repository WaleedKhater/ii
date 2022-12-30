
import '../../../../../domain/models/doctormodel.dart';

class FirebaseSignUpWithEmailAndPasswordUseCaseInput {
  final DoctorModel? user;
  final String? password;

  FirebaseSignUpWithEmailAndPasswordUseCaseInput({
    this.user,
    this.password,
  });
}
