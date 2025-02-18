import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/features/chat/presentation/views/widgets/chat_container.dart';

import '../../../../../core/utils/styles.dart';
import '../../managers/get_delivery_data_cubit/get_delivery_data_cubit.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDeliveryDataCubit, GetDeliveryDataState>(
      builder: (context, state) {
        if (state is GetDeliveryDataFailure) {
          return const Center(
            child: Text(
              'Error getting chats',
              style: Styles.textStyle25,
            ),
          );
        } else if (state is GetDeliveryDataSuccess) {
          return Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Chats',
                style: Styles.textStyle30,
              ),
              const Divider(),
              Expanded(
                  child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: state.delivery.length,
                itemBuilder: (context, index) =>
                    ChatContainer(user: state.delivery[index]),
              ))
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
