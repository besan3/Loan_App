class VerificationModel {
  String? message;
  Data? data;
  bool? success;

  VerificationModel({this.message, this.data, this.success});

  VerificationModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['success'] = this.success;
    return data;
  }

  @override
  String toString() {
    return 'VerificationModel{message: $message, data: $data, success: $success}';
  }
}

class Data {
  String? token;
  int? draft;
  User? user;

  Data({this.token, this.draft, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    draft = json['draft'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['draft'] = this.draft;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Data{token: $token, draft: $draft, user: $user}';
  }
}

class User {
  String? phoneNumber;
  String? firstName;
  String? lastName;
  String? email;
  String? dateOfBirth;
  String? addressLine1;
  String? addressLine2;
  String? address;
  String? image;

  User(
      {this.phoneNumber,
        this.firstName,
        this.lastName,
        this.email,
        this.dateOfBirth,
        this.addressLine1,
        this.addressLine2,
        this.address,
        this.image});

  User.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    dateOfBirth = json['date_of_birth'];
    addressLine1 = json['address_line1'];
    addressLine2 = json['address_line2'];
    address = json['address'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone_number'] = this.phoneNumber;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['date_of_birth'] = this.dateOfBirth;
    data['address_line1'] = this.addressLine1;
    data['address_line2'] = this.addressLine2;
    data['address'] = this.address;
    data['image'] = this.image;
    return data;
  }

  @override
  String toString() {
    return 'User{phoneNumber: $phoneNumber, firstName: $firstName, lastName: $lastName, email: $email, dateOfBirth: $dateOfBirth, addressLine1: $addressLine1, addressLine2: $addressLine2, address: $address, image: $image}';
  }
}
