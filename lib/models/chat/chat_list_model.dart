class ChatListModel {
  int response;
  List<Items> items;

  ChatListModel({this.response, this.items});

  ChatListModel.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    if (json['items'] != null) {
      json['items'].forEach((f) {
        items.add(new Items.fromJson(json['items']));
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
  Sender sender;
  Sender receiver;

  Items({this.sender, this.receiver});

  Items.fromJson(Map<String, dynamic> json) {
    sender =
        json['sender'] != null ? new Sender.fromJson(json['sender']) : null;
    receiver =
        json['receiver'] != null ? new Sender.fromJson(json['receiver']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sender != null) {
      data['sender'] = this.sender.toJson();
    }
    if (this.receiver != null) {
      data['receiver'] = this.receiver.toJson();
    }
    return data;
  }
}

class Sender {
  String id;
  String name;

  Sender({this.id, this.name});

  Sender.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
