import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foody/constants.dart';
import 'package:foody/core/common/custom_icon.dart';
import 'package:foody/core/utils/styles.dart';
import 'package:foody/features/chat/data/models/message_model.dart';
import 'package:foody/features/profile/data/models/user_model.dart';

import 'chat_bubble.dart';
import 'chatting_text_field.dart';
import 'messages_list_view.dart';

class ChattingViewBody extends StatelessWidget {
  const ChattingViewBody(
      {super.key, required this.user, required this.messages});
  final List<MessageModel> messages;
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Row(
                children: [
                  CustomIcon(),
                  Spacer(),
                  Text(
                    'Chat',
                    style: Styles.textStyle30,
                  ),
                  Spacer(),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onLongPress: () {},
                child: Container(
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 0.1),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1, 1),
                        )
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        backgroundImage: CachedNetworkImageProvider(user.image),
                      ),
                      Text(
                        user.firstName + ' ' + user.secondName,
                        style: Styles.textStyle20,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: messages.length,
                reverse: true,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) => ChatBubble(
                  isSender: true,
                  text: messages[index].text,
                ),
              )),
              // MessagesListView(
              //   email: user.email,
              // ),
              const SizedBox(
                height: 63,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 5,
          left: 5,
          right: 5,
          child: ChattingTextField(
            email: user.email,
          ),
        ),
      ],
    );
  }
}
