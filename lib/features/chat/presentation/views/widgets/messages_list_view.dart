import 'package:flutter/material.dart';

import 'chat_bubble.dart';

class MessagesListView extends StatelessWidget {
  const MessagesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) => const ChatBubble(isSender: true),
    ));
  }
}
