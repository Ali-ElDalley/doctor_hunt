import 'dart:io';

import 'package:doctor_hunt/apps/core/models/user_model.dart';
import 'package:doctor_hunt/apps/core/network/error/app_Exception.dart';
import 'package:doctor_hunt/apps/features/patient/home/data/data_sourcess/user_data_sourcess.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserRepo {
  final UserDataSource dataSource;
  UserRepo(this.dataSource);
  Future<UserModel> getCurrentUser() async {
    try {
      final data = await dataSource.getCurrentUser();
      return UserModel.fromJson(data);
    } on PostgrestException catch (e) {
      throw AppException(e.message);
    } on Exception catch (e) {
      throw AppException(e.toString());
    } catch (e) {
      throw AppException("Something went wrong");
    }
  }

  Future<String> updateAvatar(File file) async {
  try {
    final url = await dataSource.uploadAvatar(file);
    await dataSource.updateAvatarUrl(url);
    return url;
  } on StorageException catch (e) {
    throw AppException(e.message);
  } on PostgrestException catch (e) {
    throw AppException(e.message);
  } catch (e) {
    throw AppException('Something went wrong');
  }
}
}