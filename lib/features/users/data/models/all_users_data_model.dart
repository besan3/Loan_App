import 'package:loan_app/features/users/domain/entities/all_users_data.dart';

class AllUsersDataModele extends AllUsersData{
  AllUsersDataModele({required super.phone_number, required super.first_name, required super.last_name, required super.image});
factory AllUsersDataModele.fromJson(Map<String, dynamic> json) {
return AllUsersDataModele(phone_number: json['phone_number'], first_name: json['first_name'], last_name: json['last_name'], image: json['image']);
}

Map<String, dynamic> toJson() {
  return {'phone_number':phone_number,
    'first_name':first_name,
    'last_name':last_name,
    'image':image
  };
}
}