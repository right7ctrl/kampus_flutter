class ProfileModel {
  int response;
  Message message;

  ProfileModel({this.response, this.message});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    message =
        json['message'] != null ? new Message.fromJson(json['message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    if (this.message != null) {
      data['message'] = this.message.toJson();
    }
    return data;
  }
}

class Message {
  String avatar;
  String name;
  String sId;
  String username;
  String mail;
  String school;

  Message({this.avatar, this.name, this.sId, this.username, this.mail, this.school});

  Message.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    avatar = json['name'];
    sId = json['_id'];
    username = json['username'];
    mail = json['mail'];
    school = json['school'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar'] = this.avatar;
    data['name'] = this.name;
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['mail'] = this.mail;
    data['school'] = this.school;
    return data;
  }
}
