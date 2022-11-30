import 'package:loan_app/features/auth/domain/entities/login_entity.dart';

class LoginModel extends LogInEntity{
 LoginModel({required super.data});
  LoginModel.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null ? new Data.fromJson(json['data']) : null);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }

    return data;
  }

  @override
  String toString() {
    return 'LoginModel{ data: $data}';
  }
}



