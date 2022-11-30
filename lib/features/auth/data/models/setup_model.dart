import 'package:loan_app/features/auth/domain/entities/setup_entity.dart';

class SetUpModel extends SetUpEntity {
  SetUpModel({required super.data});
  factory SetUpModel.fromJson(Map<String,dynamic>json){
    return SetUpModel(data:SetUpDataModel.fromJson(json['data']));
}
}

class SetUpDataModel extends SetUpData {
  SetUpDataModel(
      { super.phoneNumber,
      required super.firstName,
      required super.lastName,
      required super.email,
      required super.dateOfBirth,
      required super.addressLine1,
      required super.addressLine2,
      required super.address,
       super.image});
  factory SetUpDataModel.fromJson(Map<String, dynamic> json) {
    return SetUpDataModel(
        phoneNumber: json['phone_number'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        email: json['email'],
        dateOfBirth: json['date_of_birth'],
        addressLine1: json['address_line1'],
        addressLine2: json['address_line2'],
        address: json['address'],
        image: json['image']);
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
