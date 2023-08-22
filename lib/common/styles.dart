import 'package:flutter/material.dart';
import 'package:test_dataon/common/colors.dart';

class Styles{
  static const TextStyle txtTitleWhiteBold =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white);
  static const textFieldHintStyle = TextStyle(
      color: AppColors.hintText, fontSize: 14, fontWeight: FontWeight.w500);

  static const textFieldHeading =
      TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);

  static const headerTextStyle = TextStyle(
      color: AppColors.whiteshade, fontSize: 28, fontWeight: FontWeight.w700);
  static const buttonName =
      TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600);
}