import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foody/constants.dart';

class MessageModel {
  final String text;
  final String sender;
  final Timestamp time;

  MessageModel({required this.text, required this.sender, required this.time});

  factory MessageModel.fromJson(jsonData) {
    return MessageModel(
        text: jsonData[kText],
        sender: jsonData[kSender],
        time: jsonData[kTime]);
  }
}
