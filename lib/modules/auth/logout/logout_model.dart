class LogOutModel {
  String? message;
  Null? data;
  bool? success;

  LogOutModel({this.message, this.data, this.success});

  LogOutModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['data'] = this.data;
    data['success'] = this.success;
    return data;
  }
}
