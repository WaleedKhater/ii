import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iattened/domain/auth/contracts/i.firebase.facade.dart';
import 'package:iattened/domain/auth/failuers/auth.failures.dart';
import 'package:fpdart/src/unit.dart';
import 'package:fpdart/src/either.dart';
import 'package:rxdart/rxdart.dart';
import 'package:iattened/domain/doctors/contracts/i.doctor.repository.dart';
import 'package:iattened/domain/models/doctormodel.dart';

class DoctorRepository implements IDoctorRepository {
  final IFirebaseAuthFacade? _authFacade;

  DoctorRepository({IFirebaseAuthFacade? authFacade})
      : _authFacade = authFacade;
  final firestore = FirebaseFirestore.instance;
  String collection = "doctors";

  @override
  Future<Either<FirebaseAuthFailure, Unit>> save({DoctorModel? user}) async {
    try {
      await firestore
          .collection(collection)
          .doc("${user?.id}")
          .set(user!.toJson());
      return right(unit);
    } catch (error) {
      return left(const FirebaseAuthFailure.serverError());
    }
  }

  @override
  Stream<DoctorModel> get currentdoctorStream {
    return Rx.switchLatest(
        _authFacade!.currentUserStream.map((uid) => doctorStream(uid)));
  }

  @override
  Stream<DoctorModel> doctorStream(String? uid) {
    final docref = firestore.collection(collection).doc(uid);
    final snapshot = docref.snapshots();
    return snapshot.map((current) => DoctorModel.fromJson(current.data()!));
  }
}
