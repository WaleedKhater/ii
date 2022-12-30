import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iattened/application/provider/doctor.repository.provider.dart';
import 'package:iattened/domain/doctors/contracts/i.doctor.repository.dart';
import 'package:iattened/domain/models/doctormodel.dart';

import '../../../../domain/core/i.failure.dart';
import '../../core/use_cases/i.use_case.dart';

final createDoctorCaseProvider = Provider((ref) =>
    CreatePatientUseCase(userRepository: ref.watch(doctorRespositoryProvider)));

class CreatePatientUseCase implements IUseCase<DoctorModel, Unit> {
  final IDoctorRepository? _userRepository;
  CreatePatientUseCase({IDoctorRepository? userRepository})
      : _userRepository = userRepository;
  @override
  Future<Either<IFailure, Unit>> execute(input) {
    return _userRepository!.save(user: input);
  }

}

