import 'package:equatable/equatable.dart';

class SetUpEntity extends Equatable{
  SetUpData data;
  SetUpEntity({required this.data});

  @override
  List<Object?> get props => [data];
}
class SetUpData extends Equatable{
  String? phoneNumber;
  String firstName;
  String lastName;
  String email;
  String dateOfBirth;
  String addressLine1;
  String addressLine2;
  String address;
  String? image;
  SetUpData({
     this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.dateOfBirth,
    required this.addressLine1,
    required this.addressLine2,
    required this.address,
     this.image,
});
  @override

  List<Object?> get props => [phoneNumber,firstName,lastName,email,dateOfBirth,addressLine1,addressLine2,address,image];


}

