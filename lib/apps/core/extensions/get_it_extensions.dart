import 'package:doctor_hunt/apps/features/common/auth/data/data_sources/auth_data_source.dart';
import 'package:doctor_hunt/apps/features/common/auth/data/repo/auth_repo.dart';
import 'package:doctor_hunt/apps/features/patient/home/data/data_sourcess/doctors_data_sourcess.dart';
import 'package:doctor_hunt/apps/features/patient/home/data/data_sourcess/specialties_data_sourcess.dart';
import 'package:doctor_hunt/apps/features/patient/home/data/data_sourcess/user_data_sourcess.dart';
import 'package:doctor_hunt/apps/features/patient/home/data/repo/doctors_repo.dart';
import 'package:doctor_hunt/apps/features/patient/home/data/repo/specialties_repo.dart';
import 'package:doctor_hunt/apps/features/patient/home/data/repo/user_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

extension GetItExtensions on GetIt {
  SupabaseClient get supabase => this<SupabaseClient>();
  AuthDataSource get authDataSource => this<AuthDataSource>();
  AuthRepo get authRepo => this<AuthRepo>();
  DoctorsDataSourcess get doctorsDataSourcess => this<DoctorsDataSourcess>();
  DoctorsRepo get doctorsRepo => this<DoctorsRepo>();
  SpecialtiesDataSource get specialtiesDataSource => this<SpecialtiesDataSource>();
  SpecialtiesRepo get specialtiesRepo => this<SpecialtiesRepo>();
  UserDataSource get userDataSource => this<UserDataSource>();
  UserRepo get userRepo => this<UserRepo>();
  ImagePicker get imagePicker => this<ImagePicker>();
}
