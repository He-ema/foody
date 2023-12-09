import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:foody/constants.dart';
import 'package:foody/core/utils/asset_data.dart';
import 'package:foody/core/utils/styles.dart';
import 'package:foody/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:foody/features/cart/presentation/views/widgets/product_container.dart';

import 'empty_cart_view.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key, required this.email});
  final String email;

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  bool startAnimation = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartSuccess) {
          if (state.cartItems.isEmpty) {
            return const EmptyCartView();
          } else {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              setState(() {
                startAnimation = true;
              });
            });
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kHorizontalPadding),
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
                          itemBuilder: (context, index, animation) => Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Slidable(
                              startActionPane: ActionPane(
                                  motion: const StretchMotion(),
                                  children: [
                                    SlidableAction(
                                      onPressed: (context) {
                                        deleteListItem(index, context, state,
                                            widget.email);
                                      },
                                      icon: Icons.delete,
                                      label: 'Delete',
                                      backgroundColor: kPrimaryColor,
                                      padding: const EdgeInsets.all(10),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ]),
                              child: ProductContainer(
                                startAnimation: startAnimation,
                                index: index,
                                state: state,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    child: Image.asset(AssetData.priceInfo),
                  ),
                )
              ],
            );
          }
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

  Future<void> removeAllFromList(CartSuccess state) async {
    _listKey.currentState!.removeAllItems(
      (context, animation) {
        return SlideTransition(
          position: animation.drive(
              Tween(begin: const Offset(2, 0.0), end: const Offset(0.0, 0.0))
                  .chain(CurveTween(curve: Curves.elasticInOut))),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                  child: Text(
                'Success',
                style: Styles.textStyle22.copyWith(color: Colors.white),
              )),
            ),
          ),
        );
      },
      duration: const Duration(milliseconds: 2000),
    );
    Future.delayed(const Duration(milliseconds: 2000), () {
      state.cartItems.clear();
    });
  }

  Future<void> deleteListItem(
      int index, BuildContext context, CartSuccess state, String email) async {
    CollectionReference favourite =
        FirebaseFirestore.instance.collection(email + kCartCollectionReference);
    String id = state.cartItems[index].id;
    state.cartItems.removeAt(index);

    _listKey.currentState!.removeItem(
      index,
      (context, animation) {
        return SlideTransition(
          position: animation.drive(
            Tween(begin: const Offset(2, 0.0), end: const Offset(0.0, 0.0))
                .chain(
              CurveTween(curve: Curves.elasticInOut),
            ),
          ),
          // sizeFactor: animation,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.5),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Center(child: Text('Deleted')),
            ),
          ),
        );
      },
      duration: const Duration(milliseconds: 2000),
    );
    await favourite.doc(id.toString()).delete();
    Future.delayed(
      const Duration(seconds: 1),
      () {
        setState(() {});
      },
    );
  }
}
