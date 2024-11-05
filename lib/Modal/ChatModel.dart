class ChatModel {
  int? status;
  String? message;
  Data? data;

  ChatModel({this.status, this.message, this.data});

  ChatModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  LoginUser? loginUser;
  LoginUser? chatUser;
  List<Livechat>? livechat;

  Data({this.loginUser, this.chatUser, this.livechat});

  Data.fromJson(Map<String, dynamic> json) {
    loginUser = json['loginUser'] != null
        ? new LoginUser.fromJson(json['loginUser'])
        : null;
    chatUser = json['chatUser'] != null
        ? new LoginUser.fromJson(json['chatUser'])
        : null;
    if (json['livechat'] != null) {
      livechat = <Livechat>[];
      json['livechat'].forEach((v) {
        livechat!.add(new Livechat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.loginUser != null) {
      data['loginUser'] = this.loginUser!.toJson();
    }
    if (this.chatUser != null) {
      data['chatUser'] = this.chatUser!.toJson();
    }
    if (this.livechat != null) {
      data['livechat'] = this.livechat!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LoginUser {
  String? userID;
  String? userLastName;
  String? userProfile;

  LoginUser({this.userID, this.userLastName, this.userProfile});

  LoginUser.fromJson(Map<String, dynamic> json) {
    userID = json['UserID'];
    userLastName = json['UserLastName'];
    userProfile = json['UserProfile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserID'] = this.userID;
    data['UserLastName'] = this.userLastName;
    data['UserProfile'] = this.userProfile;
    return data;
  }
}

class Livechat {
  String? chatId;
  String? orderId;
  String? senderId;
  String? receiverId;
  String? msgType;
  String? message;
  String? readStatus;
  String? createdAt;

  Livechat(
      {this.chatId,
      this.orderId,
      this.senderId,
      this.receiverId,
      this.msgType,
      this.message,
      this.readStatus,
      this.createdAt});

  Livechat.fromJson(Map<String, dynamic> json) {
    chatId = json['chat_id'];
    orderId = json['order_id'];
    senderId = json['sender_id'];
    receiverId = json['receiver_id'];
    msgType = json['msg_type'];
    message = json['message'];
    readStatus = json['read_status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chat_id'] = this.chatId;
    data['order_id'] = this.orderId;
    data['sender_id'] = this.senderId;
    data['receiver_id'] = this.receiverId;
    data['msg_type'] = this.msgType;
    data['message'] = this.message;
    data['read_status'] = this.readStatus;
    data['created_at'] = this.createdAt;
    return data;
  }
}
