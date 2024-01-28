import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:foody/features/chat/data/models/message_model.dart';
import 'package:hive/hive.dart';

import '../../../../../constants.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  List<MessageModel> messagesList = [];
  void getMessages(String receiverName) {
    var box = Hive.box(kEmail);
    CollectionReference chat = FirebaseFirestore.instance
        .collection(sortName(receiverName + box.get(kEmail)));
    chat.orderBy(kTime, descending: true).snapshots().listen((event) {
      emit(ChatLoading());
      messagesList.clear();
      for (var doc in event.docs) {
        messagesList.add(MessageModel.fromJson(doc));
      }

      emit(ChatSuccess(messagesList));
    });
  }

  void sendMessage(String collectionName, String message) {
    CollectionReference chat =
        FirebaseFirestore.instance.collection(sortName(collectionName));
    var box = Hive.box(kEmail);

    chat.add({
      kText: message,
      kSender: box.get(kEmail),
      kTime: DateTime.now(),
    });
  }

  String sortName(String theRequiredTosort) {
    List<String> charList = theRequiredTosort.split('');
    charList.sort();

    String sortedName = charList.join();
    return sortedName;
  }

  void sendNotification({
    required String title,
    required String body,
    required String token,
    String? image,
  }) async {
    try {
      String serverKey =
          'AAAA3LDIS2A:APA91bHvAxiXqZcdIcZC0dX9vGzEwIrBE-TkCyvCPetB_0Y-HgLchkO91WeF8YXAu1SHaN9MBE30QD9NljLYAkvxOppaWtw9VXtWts3y8KtFQq-ZUnzDiB_rv3_1A1pKTmnWxxYAStw9';
      final dio = Dio();
      final response = await dio.post(
        'https://fcm.googleapis.com/fcm/send',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'key=$serverKey',
          },
        ),
        data: {
          'notification': {
            'body': body,
            'title': title,
          },
          'priority': 'high',
          'data': {
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'id': '1',
            'status': 'done',
          },
          'to': token,
        },
      );

      // Handle the response if needed
      print('Response: ${response.data}');
    } catch (e) {
      print('Error: $e');
    }
  }
}
