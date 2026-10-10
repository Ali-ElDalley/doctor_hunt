import 'package:supabase_flutter/supabase_flutter.dart';

class SpecialtiesDataSource {
  final SupabaseClient _client;

  SpecialtiesDataSource(this._client);

  Future<List<Map<String, dynamic>>> getSpecialties() async {
    return await _client
        .from('specialties')
        .select('id, name, slug')
        .order('name', ascending: true);
  }
}