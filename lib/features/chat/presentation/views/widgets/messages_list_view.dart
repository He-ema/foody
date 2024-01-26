import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/features/chat/data/models/message_model.dart';
import 'package:foody/features/chat/presentation/managers/chat_cubit/chat_cubit.dart';

import 'chat_bubble.dart';

class MessagesListView extends StatelessWidget {
  const MessagesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(child: BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        List<MessageModel> messages =
            BlocProvider.of<ChatCubit>(context).messagesList;
        return ListView.builder(
          itemCount: messages.length,
          reverse: true,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) => const ChatBubble(isSender: true),
        );
      },
    ));
  }
}
