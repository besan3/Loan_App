import 'package:loan_app/features/auth/domain/entities/login_entity.dart';
class LogInModel extends LogInEntity{
  LogInModel({super.user,super.draft,super.token});

  factory LogInModel.fromJson(Map<String, dynamic> json) {
    return LogInModel(user : json['user'] != null ? UserModel.fromJson(json['user']) : null,
        token : json['token'],
        draft: json['draft']
    );
    // token = json['token'];
    // draft = json['draft'];
    // user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

}
// class LoginModel extends LogInEntity{
//  LoginModel({required super.data});
//   LoginModel.fromJson(Map<String, dynamic> json) {
//     data = (json['data'] != null ? Data.fromJson(json['data']) : null);
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//
//     return data;
//   }
//
//   @override
//   String toString() {
//     return 'LoginModel{ data: $data}';
//   }
// }



class UserModel extends User{
  UserModel.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    dateOfBirth = json['date_of_birth'];
    addressLine1 = json['address_line1'];
    addressLine2 = json['address_line2'];
    address = json['address'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone_number'] = this.phoneNumber;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['date_of_birth'] = this.dateOfBirth;
    data['address_line1'] = this.addressLine1;
    data['address_line2'] = this.addressLine2;
    data['address'] = this.address;
    data['image'] = this.image;
    return data;
  }


}