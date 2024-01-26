import 'package:foody/constants.dart';

class MessageModel {
  final String text;
  final String sender;

  MessageModel({
    required this.text,
    required this.sender,
  });

  factory MessageModel.fromJson(jsonData) {
    return MessageModel(
      text: jsonData[kText],
      sender: jsonData[kSender],
    );
  }
}
