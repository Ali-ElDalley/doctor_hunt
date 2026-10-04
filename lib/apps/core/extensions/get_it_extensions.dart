import 'package:doctor_hunt/apps/features/common/auth/data/datasources/supabase_data_source.dart';
import 'package:doctor_hunt/apps/features/common/auth/data/repo/auth_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

extension GetItExtensions on GetIt {
  SupabaseClient get supabase => this<SupabaseClient>();
  SupabaseDataSource get supabaseDataSource => this<SupabaseDataSource>();
  AuthRepo get authRepo => this<AuthRepo>();
}
