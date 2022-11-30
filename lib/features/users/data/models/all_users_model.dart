import 'package:loan_app/features/users/data/models/all_users_data_model.dart';
import 'package:loan_app/features/users/domain/entities/all_users.dart';

class AllUsersModel extends AllUsers{
  AllUsersModel({super.message, required super.data,super.success});

factory AllUsersModel.fromJson(Map<String, dynamic> json){
 return AllUsersModel(
message: json['message'],
   data:  json['data'].map<AllUsersDataModel>((dataJson)=>AllUsersDataModel.fromJson((dataJson))).toList(),
 success: json['success']
 );

}

  Map<String, dynamic> toJson() {
  return {
    'message':message,
    'data':data.map<Map>((data) => data.toJson()).toList(),
    'success':success
  };
  }

}