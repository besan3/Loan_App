import 'package:equatable/equatable.dart';

class RequestCodeEntity extends Equatable{

   int? data;

  RequestCodeEntity({
     this.data,


});
  @override

  List<Object?> get props => [data];


}