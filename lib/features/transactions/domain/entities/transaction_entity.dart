import 'package:equatable/equatable.dart';

class TransactionEntity extends Equatable{
  bool success;
  String message;
  TransactionEntity({required this.success,required this.message});
  @override

  List<Object?> get props => [success,message];




}