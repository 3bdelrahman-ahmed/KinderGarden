class GradesModel {
  List<Data>? data;
  String? message;

  GradesModel({this.data, this.message});

  GradesModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  int? id;
  String? courseName;
  String? grade;

  Data({this.id, this.courseName, this.grade});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseName = json['courseName'];
    grade = json['grade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['courseName'] = this.courseName;
    data['grade'] = this.grade;
    return data;
  }
}
