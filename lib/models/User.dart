import 'dart:io';
import 'dart:io' as io;

class UserModel {
  String id = '';
  String dateOfBirth = '';
  String fullName = '';
  String email = '';
  String password = '';
  int phoneNumber = 0;

  UserModel(
      {this.id = '',
        this.dateOfBirth = '',
        this.fullName = '',
        this.email = '',
        this.password = '',
        this.phoneNumber = 0}) {}
  Map toJson() => {
    'id': id,
    'dateOfBirth': dateOfBirth,
    'fullName': fullName,
    'email': email,
    'phoneNumber': phoneNumber
  };
  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateOfBirth = json['dateOfBirth'];
    fullName = json['fullName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
  }
}