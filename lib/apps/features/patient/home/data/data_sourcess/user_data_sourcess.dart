import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

class UserDataSource {
  final SupabaseClient _client;
  UserDataSource(this._client);
  Future<Map<String, dynamic>> getCurrentUser() async {
    final uid = _client.auth.currentUser!.id;
    return await _client
        .from('users')
        .select('id, full_name, role, avatar_url')
        .eq('id', uid)
        .single();
  }

  Future<String> uploadAvatar(File file) async {
  final uid = _client.auth.currentUser!.id;
  final ext = file.path.split('.').last.toLowerCase();
  final path = '$uid/avatar.$ext';
  final mime = ext == 'jpg' ? 'jpeg' : ext;

  await _client.storage.from('avatars').upload(
        path,
        file,
        fileOptions: FileOptions(upsert: true, contentType: 'image/$mime'),
      );

  final url = _client.storage.from('avatars').getPublicUrl(path);
  return '$url?v=${DateTime.now().millisecondsSinceEpoch}';
}

Future<void> updateAvatarUrl(String url) async {
  final uid = _client.auth.currentUser!.id;
  await _client.from('users').update({'avatar_url': url}).eq('id', uid);
}
}