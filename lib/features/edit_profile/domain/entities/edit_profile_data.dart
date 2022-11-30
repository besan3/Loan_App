import 'package:equatable/equatable.dart';

class EditProfileData extends Equatable{
  String phone_number;
  String first_name;
  String last_name;
  String email;
  String address_line1;
  String address_line2;
  String address;
  String image;
  String date_of_birth;


  EditProfileData(
      {
       required this.phone_number,
        required this.first_name,
        required this.last_name,
        required this.email,
        required this.address_line1,
        required this.address_line2,
        required this.address,
        required this.image,
        required this.date_of_birth,

      });

  @override

  List<Object?> get props => [phone_number,first_name,last_name,email,address_line1,address_line2,address,image];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone_number'] = this.phone_number;
    data['first_name'] = this.first_name;
    data['last_name'] = this.last_name;
    data['image'] = this.image;
    data['date_of_birth'] = this.date_of_birth;
    data['email'] = this.email;
    data['address'] = this.address;
    data['address_line1'] = this.address_line1;
    data['address_line2'] = this.address_line2;
    return data;
  }




}