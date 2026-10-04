import 'package:doctor_hunt/apps/core/extensions/get_it_extensions.dart';
import 'package:doctor_hunt/apps/features/common/auth/data/datasources/supabase_data_source.dart';
import 'package:doctor_hunt/apps/features/common/auth/data/repo/auth_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;
void setupGetIt() {
  getIt.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);
  getIt.registerLazySingleton<SupabaseDataSource>(() => SupabaseDataSource(getIt.supabase));
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo(getIt.supabaseDataSource));
}
