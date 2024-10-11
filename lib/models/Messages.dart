import 'package:cloud_firestore/cloud_firestore.dart';

class Messages {
  final String sendId;
  final String messages;
  final String sendEmail;
  final String receiverId;
  final Timestamp timestamp;

  Messages(
      {required this.messages,
      required this.timestamp,
      required this.sendEmail,
      required this.sendId,
      required this.receiverId});
  Map<String, dynamic> toMap() {
    return {
      "senderId": sendId,
      "sendEmail": sendEmail,
      "messages": messages,
      "timestamp": timestamp,
      "receiverId": receiverId
    };
  }

  // factory Messages.fromJson(jsonData) {
  //   return Messages(messages: jsonData["messages"], id: jsonData["email"]);
  // }
}
