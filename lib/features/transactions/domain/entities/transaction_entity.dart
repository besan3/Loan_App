import 'package:equatable/equatable.dart';

class TranactionEntity extends Equatable{
  bool success;
  TranactionEntity({required this.success});
  @override

  List<Object?> get props => [success];




}