import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:foody/features/chat/data/models/message_model.dart';

import '../../../../../constants.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  List<MessageModel> messagesList = [];
  void getMessages(String collectionName) {
    CollectionReference chat =
        FirebaseFirestore.instance.collection(sortName(collectionName));
    chat.orderBy(kTime, descending: true).snapshots().listen((event) {
      messagesList.clear();

      for (var doc in event.docs) {
        messagesList.add(MessageModel.fromJson(doc));
      }

      emit(ChatSuccess(messagesList));
    });
  }

  String sortName(String theRequiredTosort) {
    List<String> charList = theRequiredTosort.split('');
    charList.sort();

    String sortedName = charList.join();
    return sortedName;
  }
}
