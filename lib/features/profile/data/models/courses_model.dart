class CoursesModel {
  List<Course>? data;
  String? message;

  CoursesModel({this.data, this.message});

  CoursesModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Course>[];
      json['data'].forEach((v) {
        data!.add(new Course.fromJson(v));
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

class Course {
  int? id;
  String? name;
  int? price;
  String? teacherName;
  bool? isSelected;

  Course({this.id, this.name, this.price, this.teacherName, this.isSelected});

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    teacherName = json['teacherName'];
    isSelected = json['isSelected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['teacherName'] = this.teacherName;
    data['isSelected'] = this.isSelected;
    return data;
  }
}
