import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:foody/constants.dart';
import 'package:foody/core/utils/styles.dart';
import 'package:foody/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:foody/features/cart/presentation/views/widgets/product_container.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key, required this.email});
  final String email;

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Cart',
                  style: Styles.textStyle30,
                ),
                const Divider(),
                Expanded(
                  child: AnimatedList(
                    key: _listKey,
                    initialItemCount: state.cartItems.length,
                    itemBuilder: (context, index, animation) => Slidable(
                      startActionPane:
                          ActionPane(motion: StretchMotion(), children: [
                        SlidableAction(
                          onPressed: (context) {},
                          icon: Icons.delete,
                          label: 'Delete',
                          backgroundColor: kPrimaryColor,
                          padding: EdgeInsets.all(10),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ]),
                      child: ProductContainer(
                        index: index,
                        state: state,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        } else if (state is CartFailure) {
          return Center(
            child: Text(state.errorMessage),
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
