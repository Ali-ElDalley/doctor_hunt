import 'package:supabase_flutter/supabase_flutter.dart';

class DoctorsDataSourcess {
  final SupabaseClient supabaseClient;

  DoctorsDataSourcess( this.supabaseClient);

  Future<List<Map<String, dynamic>>> getDoctors() async {
    final result = await supabaseClient
        .from('doctors')
        .select('*, specialties(name, slug)')
        .order('rating', ascending: true);
    return result;
  }
}