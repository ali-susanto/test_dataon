import 'package:test_dataon/models/user_model.dart';

class BaseResponse {
  final bool? success;
  final User? data;

  BaseResponse({this.success, this.data});
}