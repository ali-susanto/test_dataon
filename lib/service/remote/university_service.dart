import 'package:dio/dio.dart';
import 'package:test_dataon/common/urls.dart';
import 'package:test_dataon/models/university_model.dart';

class UniversityService {
  Future<List<UniversityModel>> getUniversity() async {
    Response<List<dynamic>> response = await Dio()
        .get(Urls.university, queryParameters: {"country": "indonesia"});
    List<UniversityModel>? listData =
        response.data?.map((e) => UniversityModel.fromJson(e)).toList();
    return listData!;
  }
}
