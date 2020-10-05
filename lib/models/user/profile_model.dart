class ProfileModel {
  int response;
  List<Items> items;

  ProfileModel({this.response, this.items});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    if (json['items'] != null) {
      items = new List<Items>();
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String avatar;
  String sId;
  String username;
  String school;
  String name;

  Items({this.avatar, this.sId, this.username, this.school, this.name});

  Items.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    sId = json['_id'];
    username = json['username'];
    school = json['school'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar'] = this.avatar;
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['school'] = this.school;
    data['name'] = this.name;
    return data;
  }
}
