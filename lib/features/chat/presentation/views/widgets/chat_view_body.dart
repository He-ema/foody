import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/features/chat/presentation/managers/cubit/get_delivery_data_cubit.dart';
import 'package:foody/features/chat/presentation/views/widgets/chat_container.dart';

import '../../../../../core/utils/styles.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDeliveryDataCubit, GetDeliveryDataState>(
      builder: (context, state) {
        if (state is GetDeliveryDataFailure) {
          return Center(
            child: Text(
              'Error getting chats',
              style: Styles.textStyle25,
            ),
          );
        } else if (state is GetDeliveryDataSuccess) {
          return Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'Chats',
                style: Styles.textStyle30,
              ),
              Divider(),
              ChatContainer(user: state.delivery[0]),
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
