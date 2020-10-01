import 'package:chat_app_flutter/models/user/user_item_model.dart';

class UserListModel {
  int response;
  int totalCount;
  List<UserItemModel> items;

  UserListModel({this.response, this.totalCount, this.items});

  UserListModel.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    totalCount = json['total_count'];
    if (json['items'] != null) {
      items = new List<UserItemModel>();
      json['items'].forEach((v) {
        items.add(new UserItemModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    data['total_count'] = this.totalCount;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

