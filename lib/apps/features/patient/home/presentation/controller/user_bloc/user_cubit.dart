import 'dart:io';

import 'package:doctor_hunt/apps/core/network/error/app_Exception.dart';
import 'package:doctor_hunt/apps/features/patient/home/data/repo/user_repo.dart';
import 'package:doctor_hunt/apps/features/patient/home/presentation/controller/user_bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class UserCubit extends Cubit<UserState> {
  final UserRepo userRepo;
  UserCubit(this.userRepo) : super(UserInitial());

  Future<void> getCurrentUser() async {
    emit(UserLoading());
    try {
      final user = await userRepo.getCurrentUser();
      if (isClosed) return;
      emit(UserLoaded(user));
    } on AppException catch (e) {
      if (isClosed) return;
      emit(UserError(e.message));
    } catch (e) {
      if (isClosed) return;
      emit(UserError("Something went wrong"));
    }
  }
  Future<void> updateAvatar(File file) async {
    final currentState = state;
    if (currentState is! UserLoaded || currentState is UserAvatarUploading) return;
    final user = currentState.user;
    emit(UserAvatarUploading(user));
    try {
      final url = await userRepo.updateAvatar(file);
      if (isClosed) return;
      emit(UserLoaded(user.copyWith(avatarUrl: url)));
    } on AppException catch (e) {
      if (isClosed) return;
      emit(UserAvatarFaild(user, e.message));
    } catch (e) {
      if (isClosed) return;
      emit(UserAvatarFaild(user, "Something went wrong"));
    }
  }
}