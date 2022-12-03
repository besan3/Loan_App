import 'package:loan_app/features/auth/domain/entities/request_code_entity.dart';

class RequestCodeModel extends RequestCodeEntity{
  RequestCodeModel({ super.data});
  factory RequestCodeModel.fromJson(Map<String, dynamic> json){
    return RequestCodeModel(data: json['data']);
}

Map<String, dynamic> toJson() {
  return {

    'data':data as String,

  };
}

}