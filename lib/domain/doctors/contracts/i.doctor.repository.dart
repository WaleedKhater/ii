import 'package:fpdart/fpdart.dart';
import 'package:iattened/domain/models/doctormodel.dart';

import '../../auth/failuers/auth.failures.dart';

abstract class IDoctorRepository {
  Stream<DoctorModel> doctorStream(String? uid);
  Stream<DoctorModel> get currentdoctorStream;
  Future<Either<FirebaseAuthFailure, Unit>> save({
    DoctorModel? user,
  });
}
