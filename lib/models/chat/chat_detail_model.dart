class ChatDetailModel {
  int response;
  List<Messages> messages;

  ChatDetailModel({this.response, this.messages});

  ChatDetailModel.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    if (json['messages'] != null) {
      messages = new List<Messages>();
      json['messages'].forEach((v) {
        messages.add(new Messages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    if (this.messages != null) {
      data['messages'] = this.messages.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Messages {
  String message;
  String senderId;

  Messages({this.message, this.senderId});

  Messages.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    senderId = json['sender_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['sender_id'] = this.senderId;
    return data;
  }
}
