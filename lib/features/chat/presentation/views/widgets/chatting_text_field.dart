import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/constants.dart';
import 'package:foody/features/chat/presentation/managers/chat_cubit/chat_cubit.dart';
import 'package:hive/hive.dart';

class ChattingTextField extends StatefulWidget {
  const ChattingTextField({super.key, required this.email});
  final String email;

  @override
  State<ChattingTextField> createState() => _ChattingTextFieldState();
}

class _ChattingTextFieldState extends State<ChattingTextField> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onSubmitted: (value) {
        var box = Hive.box(kEmail);

        BlocProvider.of<ChatCubit>(context)
            .sendMessage(box.get(kEmail) + widget.email, value);
        controller.clear();
        // _controller.animateTo(0,
        //     duration: Duration(milliseconds: 500),
        //     curve: Curves.fastOutSlowIn);
      },
      decoration: InputDecoration(
        hintText: 'Type Here',
        filled: true,
        fillColor: Colors.white,
        suffixIcon: IconButton(
          onPressed: () {
            if (controller.text.isNotEmpty || controller.text != ' ') {
              var box = Hive.box(kEmail);

              BlocProvider.of<ChatCubit>(context)
                  .sendMessage(box.get(kEmail) + widget.email, controller.text);
              controller.clear();
            }
          },
          icon: const Icon(
            Icons.send,
            color: kPrimaryColor,
          ),
        ),
        border: createBorder(),
        errorBorder: createBorder(),
        focusedBorder: createBorder(),
        disabledBorder: createBorder(),
        enabledBorder: createBorder(),
      ),
    );
  }

  OutlineInputBorder createBorder() => OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 2, color: kPrimaryColor));
}
