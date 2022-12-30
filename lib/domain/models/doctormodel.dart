// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
part 'doctormodel.freezed.dart';
part 'doctormodel.g.dart';

@freezed
class DoctorModel with _$DoctorModel {
  const factory DoctorModel({
    String? id,
    String? name,
    String? phone,
    String? email,
    String? section,
  }) = _DoctorModel;
  factory DoctorModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorModelFromJson(json);
}
