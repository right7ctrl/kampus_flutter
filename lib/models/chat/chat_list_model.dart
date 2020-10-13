class ChatListModel {
  int response;
  List<Items> items;

  ChatListModel({this.response, this.items});

  ChatListModel.fromJson(Map<String, dynamic> json) {
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
  String sId;
  Receiver receiver;
  Receiver sender;

  Items({this.sId, this.receiver, this.sender});

  Items.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    receiver = json['receiver'] != null
        ? new Receiver.fromJson(json['receiver'])
        : null;
    sender =
        json['sender'] != null ? new Receiver.fromJson(json['sender']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.receiver != null) {
      data['receiver'] = this.receiver.toJson();
    }
    if (this.sender != null) {
      data['sender'] = this.sender.toJson();
    }
    return data;
  }
}

class Receiver {
  String id;
  String name;

  Receiver({this.id, this.name});

  Receiver.fromJson(Map<String, dynamic> json) {
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
