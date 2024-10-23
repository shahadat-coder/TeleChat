import 'dart:convert';


List<MessageModel> messageModelFromJson(String str) => List<MessageModel>.from(json.decode(str).map((x) => MessageModel.fromJson(x)));

String messageModelToJson(List<MessageModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MessageModel {
  int? id;
  int? senderId;
  int? receiverId;
  String? message;
  String? type;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? isMe;

  MessageModel({
    this.id,
    this.senderId,
    this.receiverId,
    this.message,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.isMe,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
    id: json["id"],
    senderId: json["sender_id"],
    receiverId: json["receiver_id"],
    message: json["message"],
    type: json["type"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    isMe: json['is_me'],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sender_id": senderId,
    "receiver_id": receiverId,
    "message": message,
    "type": type,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}