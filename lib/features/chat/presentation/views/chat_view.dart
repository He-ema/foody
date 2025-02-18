import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/core/common/widgets/background_stack.dart';
import 'package:foody/features/chat/presentation/views/widgets/chat_view_body.dart';

import '../managers/get_delivery_data_cubit/get_delivery_data_cubit.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: BackgroundStack(
        body: BlocProvider(
          create: (context) => GetDeliveryDataCubit()..getDeliveryData(),
          child: const ChatViewBody(),
        ),
        isBig: false,
      ),
    );
  }
}
