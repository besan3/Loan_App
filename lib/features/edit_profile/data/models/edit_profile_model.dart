import 'package:loan_app/features/edit_profile/data/models/edit_profile_data_model.dart';
import 'package:loan_app/features/edit_profile/domain/entities/edit_profile_data.dart';
import 'package:loan_app/features/edit_profile/domain/entities/edit_profile_entity.dart';

class EditProfileModel extends EditProfile{
  EditProfileModel({ super.data});

   EditProfileModel.fromJson(Map<String, dynamic> json){
     data = (json['data'] != null ? new EditProfileDataModel.fromJson(json['data']) : null);
}

Map<String, dynamic> toJson() {
  return {

    'data':data,

  };
}}