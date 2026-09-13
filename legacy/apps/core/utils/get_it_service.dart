
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

import '../extensions/get_it_extension.dart';
import '../network/api/dio_service.dart';
import '../network/hive/flutter_secure_storage_manager.dart';

final getIt = GetIt.instance;
void setupGetIt() {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<DioService>(() => DioService(dio: getIt.dio));
  getIt.registerLazySingleton<ImagePicker>(() => ImagePicker());
  getIt.registerLazySingleton<FlutterSecureStorageManager>(
    () => FlutterSecureStorageManager(FlutterSecureStorage()),
  );
}
