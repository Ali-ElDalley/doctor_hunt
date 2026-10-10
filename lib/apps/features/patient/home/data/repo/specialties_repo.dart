import 'package:doctor_hunt/apps/core/models/specialty_model.dart';
import 'package:doctor_hunt/apps/core/network/error/app_exception.dart';
import 'package:doctor_hunt/apps/features/patient/home/data/data_sourcess/specialties_data_sourcess.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SpecialtiesRepo {
  final SpecialtiesDataSource _dataSource;

  SpecialtiesRepo(this._dataSource);

  Future<List<SpecialtyModel>> getSpecialties() async {
    try {
      final data = await _dataSource.getSpecialties();
      return data.map(SpecialtyModel.fromJson).toList();
    } on PostgrestException catch (e) {
      throw AppException(e.message);
    } catch (e) {
      throw AppException('Something went wrong, please try again');
    }
  }
}