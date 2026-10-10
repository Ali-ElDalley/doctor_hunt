import 'package:doctor_hunt/apps/core/models/doctor_model.dart';

abstract class DoctorState {}

class DoctorInitialState extends DoctorState {}

class DoctorLoadingState extends DoctorState {}

class DoctorLoadedState extends DoctorState {
  final List<DoctorModel> doctors;
  DoctorLoadedState({required this.doctors});
}

class DoctorErrorState extends DoctorState {
  final String message;
  DoctorErrorState({required this.message});
}