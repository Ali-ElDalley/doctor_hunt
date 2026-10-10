import 'package:doctor_hunt/apps/core/models/specialty_model.dart';

abstract class SpecialtiesState {}

class SpecialtiesInitial extends SpecialtiesState {}

class SpecialtiesLoading extends SpecialtiesState {}

class SpecialtiesLoaded extends SpecialtiesState {
  final List<SpecialtyModel> specialties;
  SpecialtiesLoaded(this.specialties);
}

class SpecialtiesError extends SpecialtiesState {
  final String message;
  SpecialtiesError(this.message);
}