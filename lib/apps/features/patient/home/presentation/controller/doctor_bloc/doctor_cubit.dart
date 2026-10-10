import 'package:doctor_hunt/apps/core/network/error/app_exception.dart';
import 'package:doctor_hunt/apps/features/patient/home/data/repo/doctors_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  final DoctorsRepo doctorsRepo;
  DoctorCubit({required this.doctorsRepo}) : super(DoctorInitialState());

  void getDoctors() async {
    emit(DoctorLoadingState());
    try {
      final doctors = await doctorsRepo.getDoctors();
      if (isClosed) return;
      emit(DoctorLoadedState(doctors: doctors));
    } on AppException catch (e) {
      if (isClosed) return;
      emit(DoctorErrorState(message: e.message));
    } catch (e) {
      if (isClosed) return;
      emit(DoctorErrorState(message: "Something went wrong"));
    }
  }
}
