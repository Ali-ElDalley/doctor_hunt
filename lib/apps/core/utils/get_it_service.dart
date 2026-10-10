import 'package:doctor_hunt/apps/core/extensions/get_it_extensions.dart';
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

final getIt = GetIt.instance;
void setupGetIt() {
  getIt.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);
  getIt.registerLazySingleton<AuthDataSource>(
    () => AuthDataSource(getIt.supabase),
  );
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepo(getIt.authDataSource),
  );
  getIt.registerLazySingleton<DoctorsDataSourcess>(
    () => DoctorsDataSourcess(getIt.supabase),
  );
  getIt.registerLazySingleton<DoctorsRepo>(
    () => DoctorsRepo(getIt.doctorsDataSourcess),
  );
  getIt.registerLazySingleton<SpecialtiesDataSource>(
    () => SpecialtiesDataSource(getIt.supabase),
  );
  getIt.registerLazySingleton<SpecialtiesRepo>(
    () => SpecialtiesRepo(getIt.specialtiesDataSource),
  );
  getIt.registerLazySingleton<UserDataSource>(
    () => UserDataSource(getIt.supabase),
  );
  getIt.registerLazySingleton<UserRepo>(
    () => UserRepo(getIt.userDataSource),
  );
  getIt.registerLazySingleton<ImagePicker>(() => ImagePicker());
}
