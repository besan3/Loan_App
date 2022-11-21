class AllUsersHome {
  String? message;
  List<Data>? data;
  bool? success;

  AllUsersHome({this.message, this.data, this.success});

  AllUsersHome.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    return data;
  }
}

class Data {
  String? phoneNumber;
  Null? firstName;
  Null? lastName;
  Null? image;
  String? updatedAt;

  Data(
      {this.phoneNumber,
        this.firstName,
        this.lastName,
        this.image,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    image = json['image'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone_number'] = this.phoneNumber;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['image'] = this.image;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
