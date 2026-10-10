import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/network/error/app_Exception.dart';
import 'package:doctor_hunt/apps/features/patient/home/data/data_sourcess/doctors_data_sourcess.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DoctorsRepo {
  final DoctorsDataSourcess dataSourcess;

  DoctorsRepo(this.dataSourcess);

  Future<List<DoctorModel>> getDoctors() async {
    try {
      final result = await dataSourcess.getDoctors();
      return result.map(DoctorModel.fromJson).toList();
    } on PostgrestException catch (e) {
      throw AppException(e.message);
    } catch (e) {
      throw AppException(e.toString());
    }
  }
}