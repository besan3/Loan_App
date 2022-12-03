import 'package:equatable/equatable.dart';

class PaymentEntity extends Equatable{
  String message;
  bool success;

  PaymentEntity({required this.message, required this.success});

  @override

  List<Object?> get props =>[message,success];



}