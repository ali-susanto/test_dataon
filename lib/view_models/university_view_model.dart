import 'package:flutter/material.dart';
import 'package:test_dataon/models/university_model.dart';
import 'package:test_dataon/service/remote/university_service.dart';

class UniversityViewModel extends ChangeNotifier {
  List<UniversityModel> universities = [];
  bool loading = false;
  Future<void> getUniversity() async {
    loading = true;
    var response = await UniversityService().getUniversity();
    loading = false;
    universities = response;
    notifyListeners();
  }
}
