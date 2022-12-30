import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iattened/domain/doctors/contracts/i.doctor.repository.dart';
import 'package:iattened/infrastructure/doctors/doctor.repository.dart';

import '../../domain/models/doctormodel.dart';

final doctorRespositoryProvider =
    Provider<IDoctorRepository>((ref) => DoctorRepository());
final currentstream = StreamProvider.autoDispose<DoctorModel>((ref) {
  final doctorrepoprovider = ref.watch(doctorRespositoryProvider);
  return doctorrepoprovider.currentdoctorStream;
});
