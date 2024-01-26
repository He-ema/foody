import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/core/common/widgets/background_stack.dart';
import 'package:foody/features/chat/presentation/managers/chat_cubit/chat_cubit.dart';
import 'package:foody/features/chat/presentation/views/widgets/chatting_view_body.dart';
import 'package:foody/features/profile/data/models/user_model.dart';
import 'package:hive/hive.dart';

import '../../../../constants.dart';
import '../../data/models/message_model.dart';

class ChattingView extends StatefulWidget {
  const ChattingView({super.key, required this.user});
  final UserModel user;

  @override
  State<ChattingView> createState() => _ChattingViewState();
}

class _ChattingViewState extends State<ChattingView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var box = Hive.box(kEmail);
    // String currentChat = sortName(box.get(kEmail) + widget.email);
    // print(currentChat);
    CollectionReference chat = FirebaseFirestore.instance
        .collection('...01227@@aaaacceegghhiillmmmmmmoooxz');
    BlocProvider.of<ChatCubit>(context).getMessages(chat);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<MessageModel>>(
      stream: BlocProvider.of<ChatCubit>(context).getMessages2(FirebaseFirestore
          .instance
          .collection('...01227@@aaaacceegghhiillmmmmmmoooxz')),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MessageModel> messagesList = snapshot.data!;
          print('object');
          var box = Hive.box(kEmail);
          List<MessageModel> messages =
              BlocProvider.of<ChatCubit>(context).messagesList;
          return Scaffold(
              backgroundColor: Theme.of(context).colorScheme.background,
              body: BackgroundStack(
                body: ChattingViewBody(
                  user: widget.user,
                  messages: messagesList,
                ),
                isBig: false,
              ));
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
