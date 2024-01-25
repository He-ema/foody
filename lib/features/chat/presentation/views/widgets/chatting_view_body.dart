import 'package:flutter/material.dart';
import 'package:foody/constants.dart';
import 'package:foody/core/common/custom_icon.dart';
import 'package:foody/core/common/widgets/custom_text_form_field.dart';
import 'package:foody/core/utils/styles.dart';
import 'package:foody/features/chat/presentation/views/widgets/chat_bubble.dart';

import 'chatting_text_field.dart';

class ChattingViewBody extends StatelessWidget {
  const ChattingViewBody({super.key});

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
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 30,
                      ),
                      Text(
                        'Ahmed Mohamed',
                        style: Styles.textStyle20,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) =>
                    const ChatBubble(isSender: true),
              )),
            ],
          ),
        ),
        const Positioned(
          bottom: 5,
          left: 5,
          right: 5,
          child: ChattingTextField(),
        ),
      ],
    );
  }
}
