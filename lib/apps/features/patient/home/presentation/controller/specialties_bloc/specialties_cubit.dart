import 'package:doctor_hunt/apps/core/network/error/app_exception.dart';
import 'package:doctor_hunt/apps/features/patient/home/data/repo/specialties_repo.dart';
import 'package:doctor_hunt/apps/features/patient/home/presentation/controller/specialties_bloc/specialties_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecialtiesCubit extends Cubit<SpecialtiesState> {
  final SpecialtiesRepo specialtiesRepo;
  SpecialtiesCubit(this.specialtiesRepo) : super(SpecialtiesInitial());

  Future<void> getSpecialties() async {
    emit(SpecialtiesLoading());
    try {
      final specialties = await specialtiesRepo.getSpecialties();
      if (isClosed) return;
      emit(SpecialtiesLoaded(specialties));
    } on AppException catch (e) {
      if (isClosed) return;
      emit(SpecialtiesError(e.message));
    } catch (e) {
      if (isClosed) return;
      emit(SpecialtiesError(e.toString()));
    }
  }
}
