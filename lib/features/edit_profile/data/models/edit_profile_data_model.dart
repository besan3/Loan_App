import 'package:loan_app/features/edit_profile/domain/entities/edit_profile_data.dart';

class EditProfileDataModel extends EditProfileData {
  EditProfileDataModel
  (
      {
        required super.phone_number,
        required super.first_name,
        required super.last_name,
        required super.email,
        required super.address_line1,
        required super.address_line2,
        required super.address,
        required super.image,
        required super.date_of_birth
      }
  );
  factory EditProfileDataModel.fromJson(Map<String, dynamic> json) {
    return EditProfileDataModel(
        phone_number: json['phone_number'],
        first_name: json['first_name'],
        last_name: json['last_name'],
        email: json['email'],
        address_line1: json['address_line1'],
        address_line2: json['address_line2'],
        address: json['address'],
        image: json['image'],
        date_of_birth: json['date_of_birth'],

);
  }

  Map<String, dynamic> toJson() {
    return {
      'phone_number': phone_number,
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'address_line1': address_line1,
      'address_line2': address_line2,
      'address': address,
      'image': image,
      'date_of_birth': date_of_birth,
    };
  }
}
