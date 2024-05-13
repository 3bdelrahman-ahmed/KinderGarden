class UserProfileModel {
  UserData? data;
  String? message;

  UserProfileModel({this.data, this.message});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new UserData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class UserData {
  int? id;
  String? name;
  String? profilePicture;
  String? birthDate;
  String? parentPhone;

  UserData(
      {this.id,
      this.name,
      this.profilePicture,
      this.birthDate,
      this.parentPhone});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    profilePicture = json['profilePicture'];
    birthDate = json['birthDate'];
    parentPhone = json['parentPhone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['profilePicture'] = this.profilePicture;
    data['birthDate'] = this.birthDate;
    data['parentPhone'] = this.parentPhone;
    return data;
  }
}
