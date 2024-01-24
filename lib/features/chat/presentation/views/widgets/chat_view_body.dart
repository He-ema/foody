import 'package:flutter/material.dart';
import 'package:foody/features/chat/presentation/views/widgets/chat_container.dart';

import '../../../../../core/utils/styles.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Text(
          'Chats',
          style: Styles.textStyle30,
        ),
        Divider(),
        ChatContainer(),
      ],
    );
  }
}
