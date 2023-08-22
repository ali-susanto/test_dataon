import 'package:flutter/material.dart';
import 'package:test_dataon/models/university_model.dart';
import 'package:test_dataon/service/remote/university_service.dart';

class UniversityViewModel extends ChangeNotifier {
  List<UniversityModel> universities = [];
  Future<void> getUniversity() async {
    var response = await UniversityService().getUniversity();
    if (response.statusCode == 200) {
      var dataResponse = UniversityModel.fromJson(response.data);
      debugPrint(dataResponse.toString());
    }
  }
}
