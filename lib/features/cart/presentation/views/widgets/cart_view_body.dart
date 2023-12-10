import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:foody/constants.dart';
import 'package:foody/core/common/widgets/custom_button.dart';
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
  bool isOpened = false;
  bool appeared = false;
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
              alignment: Alignment.bottomCenter,
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
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  alignment: const Alignment(1, 1),
                  onEnd: () {
                    appeared == true ? appeared = false : appeared = true;
                    setState(() {});
                  },
                  margin: isOpened
                      ? const EdgeInsets.all(10)
                      : const EdgeInsets.only(bottom: 10),
                  padding: isOpened
                      ? const EdgeInsets.symmetric(horizontal: 20)
                      : EdgeInsets.zero,
                  height:
                      isOpened ? MediaQuery.of(context).size.height * 0.25 : 60,
                  width: isOpened ? MediaQuery.of(context).size.width : 150,
                  decoration: BoxDecoration(
                    color: isOpened ? kPrimaryColor : Colors.green,
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                        image: AssetImage(AssetData.pricePattern),
                        fit: BoxFit.cover),
                  ),
                  child: isOpened
                      ? AnimatedOpacity(
                          duration: const Duration(seconds: 1),
                          opacity: appeared ? 1 : 0,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Payment-details',
                                    style: Styles.textStyle22
                                        .copyWith(color: Colors.white),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        isOpened == true
                                            ? isOpened = false
                                            : isOpened = true;
                                        setState(() {});
                                      },
                                      // ignore: prefer_const_constructors
                                      icon: Icon(
                                        Icons.close_rounded,
                                        size: 30,
                                        color: Colors.white,
                                      )),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Sub-Total : ',
                                    style: Styles.textStyle22
                                        .copyWith(color: Colors.white),
                                  ),
                                  Text(
                                    '50\$',
                                    style: Styles.textStyle22
                                        .copyWith(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Delivery : ',
                                    style: Styles.textStyle22
                                        .copyWith(color: Colors.white),
                                  ),
                                  Text(
                                    '10\$',
                                    style: Styles.textStyle22
                                        .copyWith(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                width: MediaQuery.of(context).size.width,
                                child: CustomButton(
                                  fillColor: Colors.white,
                                  textColor: kPrimaryColor,
                                  text: 'Confirm',
                                  onPressed: () {},
                                ),
                              )
                            ],
                          ),
                        )
                      : Center(
                          child: GestureDetector(
                            onTap: () {
                              isOpened == true
                                  ? isOpened = false
                                  : isOpened = true;
                              setState(() {});
                            },
                            child: AnimatedOpacity(
                              duration: const Duration(seconds: 1),
                              opacity: appeared ? 0 : 1,
                              child: Text(
                                'Pay',
                                style: Styles.textStyle22
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                ),
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

class PriceArea extends StatelessWidget {
  const PriceArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(15),
        image: const DecorationImage(
            image: AssetImage(AssetData.pricePattern), fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sub-Total : ',
                style: Styles.textStyle22.copyWith(color: Colors.white),
              ),
              Text(
                '50\$',
                style: Styles.textStyle22.copyWith(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
