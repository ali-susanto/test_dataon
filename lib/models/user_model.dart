// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String userName;
  final String password;
  final String fullName;
  final String photo;
  
  const User({
    required this.userName,
    required this.password,
    required this.fullName,
    required this.photo,
  });

  @override
  List<Object> get props => [userName, password, fullName, photo];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'userName': userName,
      'password': password,
      'fullName': fullName,
      'photo': photo,
    };
  }

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      userName: map['userName'] as String,
      password: map['password'] as String,
      fullName: map['fullName'] as String,
      photo: map['photo'] as String,
    );
  }
}
