import 'package:equatable/equatable.dart';

class RequestCodeEntity extends Equatable{

   int data;

  RequestCodeEntity({
    required this.data,


});
  @override

  List<Object?> get props => [data];


}