// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:test_dataon/models/user_model.dart';
import 'package:test_dataon/service/local/user_service.dart';

class UserViewModel extends ChangeNotifier {
  User? user;
  bool valid = false;
  Future<void> register(User users) async {
    var res = await UserService.instance.register(users);
    if (res != null) {
      valid = true;
      notifyListeners();
    } else {
      valid = false;
      notifyListeners();
    }
  }

  Future<void> login(String userName, String password) async {
    var res = await UserService.instance.login(userName, password);
    user = res.data;
    valid = res.success!;
    notifyListeners();
  }
}
