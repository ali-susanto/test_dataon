import 'package:dio/dio.dart';
import 'package:test_dataon/common/urls.dart';

class UniversityService {
  Future<Response> getUniversity() async {
    var response = await Dio()
        .get(Urls.university, queryParameters: {"country": "indonesia"});
    return response;
  }
}
