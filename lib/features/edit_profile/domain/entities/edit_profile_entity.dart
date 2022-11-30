import 'package:equatable/equatable.dart';

import 'edit_profile_data.dart';

class EditProfile extends Equatable{

  EditProfileData? data;
  EditProfile({this.data});
  @override

  List<Object?> get props => [data];

 // Map toJson()=>{
 //   "data": List<dynamic>.from(data.map((x) => x.toJson())),
 // };



}