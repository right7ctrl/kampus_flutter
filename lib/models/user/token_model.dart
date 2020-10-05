class TokenModel {
  String avatar;
  String sId;
  String name;
  String username;
  String email;
  String school;

  TokenModel(
      {this.avatar,
      this.sId,
      this.name,
      this.username,
      this.email,
      this.school});

  TokenModel.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    sId = json['_id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    school = json['school'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar'] = this.avatar;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['school'] = this.school;
    return data;
  }
}
