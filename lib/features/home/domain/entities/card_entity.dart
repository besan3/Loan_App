import 'package:equatable/equatable.dart';

class CardEntity extends Equatable {
  String? message;
  CardData? data;
  bool? success;

  CardEntity({ this.data,this.success,this.message});

  @override

  List<Object?> get props => [message,data,success];
}
class CardData extends Equatable {
  NearCreditor? nearCreditor;
  NearCreditor? nearDebitor;

  CardData({this.nearCreditor, this.nearDebitor});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (nearCreditor != null) {
      data['near creditor'] = nearCreditor!.toJson();
    }
    if (nearDebitor != null) {
      data['near debitor'] = nearDebitor!.toJson();
    }
    return data;
  }
  @override
  // TODO: implement props
  List<Object?> get props => [nearCreditor,nearDebitor];
}
class NearCreditor extends Equatable {
  int? amountDebt;

  NearCreditor({this.amountDebt});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['amount_debt'] = amountDebt;
    return data;
  }
  @override
  // TODO: implement props
  List<Object?> get props => [amountDebt];

}