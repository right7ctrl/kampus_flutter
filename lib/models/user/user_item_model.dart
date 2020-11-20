class UserItemModel {
  String avatar;
  String sId;
  String name;
  String username;
  String school;
  int grade;

  UserItemModel(
      {this.avatar,
      this.sId,
      this.name,
      this.username,
      this.school,
      this.grade});

  UserItemModel.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    sId = json['_id'];
    name = json['name'];
    username = json['username'];
    school = json['school'];
    grade = json['grade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar'] = this.avatar;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['username'] = this.username;
    data['school'] = this.school;
    data['grade'] = this.grade;
    return data;
  }
}
