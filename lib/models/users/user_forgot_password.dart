part of "../models.dart";

class UserForgotPassword {
  String? email;

  UserForgotPassword({this.email});

  UserForgotPassword.fromJson(Map<String, dynamic> json) {
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    return data;
  }
}
