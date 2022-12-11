import 'package:loan_app/features/home/domain/entities/card_entity.dart';

class CardModel extends CardEntity{
  CardModel({required super.data});

CardModel.fromJson(Map<String, dynamic> json) {
message = json['message'];
data = json['data'] != null ? DataCardModel.fromJson(json['data']) : null;
success = json['success'];
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['message'] = message;
  if (this.data != null) {
    data['data'] = this.data!.toJson();
  }
  data['success'] = success;
  return data;
}

}

class DataCardModel extends CardData{
  DataCardModel.fromJson(Map<String, dynamic> json) {
    nearCreditor = json['near creditor'] != null
        ? NearCreditorModel.fromJson(json['near creditor'])
        : null;
    nearDebitor = json['near debitor'] != null
        ? NearCreditorModel.fromJson(json['near debitor'])
        : null;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = Map<String, dynamic>();
  //   if (nearCreditor != null) {
  //     data['near creditor'] = nearCreditor!.toJson();
  //   }
  //   if (nearDebitor != null) {
  //     data['near debitor'] = nearDebitor!.toJson();
  //   }
  //   return data;
  // }
}
class NearCreditorModel extends NearCreditor{
  NearCreditorModel.fromJson(Map<String, dynamic> json) {
    amountDebt = json['amount_debt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['amount_debt'] = amountDebt;
    return data;
  }


}