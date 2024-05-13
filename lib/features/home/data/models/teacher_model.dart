class TeachersModel {
  List<Teacher>? data;
  String? message;

  TeachersModel({this.data, this.message});

  TeachersModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Teacher>[];
      json['data'].forEach((v) {
        data!.add(new Teacher.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Teacher {
  int? id;
  String? name;
  String? email;
  String? phone;
  int? salary;
  String? profilePicture;
  String? createdAt;

  Teacher(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.salary,
      this.profilePicture,
      this.createdAt});

  Teacher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    salary = json['salary'];
    profilePicture = json['profilePicture'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['salary'] = this.salary;
    data['profilePicture'] = this.profilePicture;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
