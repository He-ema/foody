import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/features/chat/data/models/message_model.dart';
import 'package:foody/features/chat/presentation/managers/chat_cubit/chat_cubit.dart';
import 'package:hive/hive.dart';

import '../../../../../constants.dart';
import 'chat_bubble.dart';

class MessagesListView extends StatefulWidget {
  const MessagesListView({
    super.key,
    required this.email,
  });
  final String email;
  @override
  State<MessagesListView> createState() => _MessagesListViewState();
}

class _MessagesListViewState extends State<MessagesListView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var box = Hive.box(kEmail);
    String currentChat = sortName(box.get(kEmail) + widget.email);
    print(currentChat);
    CollectionReference chat =
        FirebaseFirestore.instance.collection(currentChat);
    BlocProvider.of<ChatCubit>(context).getMessages(chat);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(child: BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        var box = Hive.box(kEmail);
        List<MessageModel> messages =
            BlocProvider.of<ChatCubit>(context).messagesList;
        if (state is ChatSuccess) {
          return ListView.builder(
            itemCount: messages.length,
            reverse: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => ChatBubble(
              isSender:
                  messages[index].sender == box.get(kEmail) ? true : false,
              text: messages[index].text,
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }

  String sortName(String theRequiredTosort) {
    List<String> charList = theRequiredTosort.split('');
    charList.sort();

    String sortedName = charList.join();
    return sortedName;
  }
}
