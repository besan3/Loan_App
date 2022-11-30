import 'package:equatable/equatable.dart';
import 'package:loan_app/features/users/domain/entities/all_users_data.dart';

class AllUsers extends Equatable{
  String? message;
  List<AllUsersData> data;
  bool? success;

  AllUsers({this.message,required this.data, this.success});
  @override

  List<Object?> get props => [message,data,success];


  @override
  String toString() {
    return 'AllUsersModel{message: $message, data: $data, success: $success}';
  }
}
