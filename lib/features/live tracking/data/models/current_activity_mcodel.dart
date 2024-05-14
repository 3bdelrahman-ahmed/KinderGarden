class CurrentActivityModel {
  List<Activity>? data;
  String? message;

  CurrentActivityModel({this.data, this.message});

  CurrentActivityModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Activity>[];
      json['data'].forEach((v) {
        data!.add(new Activity.fromJson(v));
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

class Activity {
  int? id;
  String? title;
  String? createdAt;
  int? userId;

  Activity({this.id, this.title, this.createdAt, this.userId});

  Activity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    createdAt = json['createdAt'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['createdAt'] = this.createdAt;
    data['userId'] = this.userId;
    return data;
  }
}
