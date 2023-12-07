import 'package:foody/constants.dart';

class UserModel {
  final String firstName;
  final String secondName;
  final String email;
  final String phone;
  final String image;

  UserModel({
    required this.firstName,
    required this.secondName,
    required this.email,
    required this.phone,
    required this.image,
  });

  factory UserModel.fromJson(jsonData) {
    return UserModel(
      firstName: jsonData[kFname],
      secondName: jsonData[kSname],
      email: jsonData[kEmail],
      phone: jsonData[kPhone],
      image: jsonData[kImage],
    );
  }
}
