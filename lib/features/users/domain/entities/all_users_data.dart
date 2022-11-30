import 'package:equatable/equatable.dart';

class AllUsersData extends Equatable {
 final   String phone_number;
    String? first_name;
    String? last_name;
   String? image;
   String? updatedAt;

  AllUsersData({
    required  this.phone_number,
      this.first_name,
     this.last_name,
      this.image,
    this.updatedAt
  });

  @override
  List<Object?> get props => [phone_number,first_name,last_name,image];


//    AllUsersData.fromJson(Map<String, dynamic> json) {
//      phone_number = json['phone_number'];
//      first_name = json['first_name'];
//      last_name = json['last_name'];
//      image = json['image'];
//      updatedAt = json['updated_at'];
//    }
//
   Map<String, dynamic> toJson() {
     final Map<String, dynamic> data = new Map<String, dynamic>();
     data['phone_number'] = this.phone_number;
     data['first_name'] = this.first_name;
     data['last_name'] = this.last_name;
     data['image'] = this.image;
     data['updated_at'] = this.updatedAt;
     return data;
   }
 }