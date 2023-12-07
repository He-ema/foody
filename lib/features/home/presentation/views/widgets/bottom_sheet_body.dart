import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foody/features/home/presentation/manager/item_handler_cubit/item_handler_cubit.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/widgets/custom_button.dart';
import '../../../../../core/utils/styles.dart';
import '../../manager/products_cubit/products_cubit.dart';

class BottomSheetBody extends StatefulWidget {
  const BottomSheetBody({
    super.key,
    required this.state,
    required this.index,
    required this.email,
  });

  final ProductsSuccess state;
  final int index;
  final String email;

  @override
  State<BottomSheetBody> createState() => _BottomSheetBodyState();
}

class _BottomSheetBodyState extends State<BottomSheetBody> {
  bool isLoading = false;
  bool isExist = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ItemHandlerCubit, ItemHandlerState>(
      listener: (context, state) {
        if (state is ItemHandlerLoading) {
          isLoading = true;
          setState(() {});
        } else if (state is ItemHandlerSuccess) {
          isLoading = false;
          setState(() {});
          isExist = state.exist;
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: 100,
                  height: 7,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kPrimaryColor),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
                        imageUrl: widget.state.products[widget.index].image!,
                        height: 150,
                        placeholder: (context, url) =>
                            const SpinKitSpinningLines(color: kPrimaryColor),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.57,
                        child: Text(
                          widget.state.products[widget.index].title!,
                          style: Styles.textStyle22,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Price : ',
                      style: Styles.textStyle22,
                    ),
                    Text(
                      '${(widget.index + 1 * 123 / 4 + 20)}\$',
                      style: Styles.textStyle22.copyWith(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey),
                    ),
                    Text(
                      '${(widget.index + 1 * 123 / 4)}\$',
                      style: Styles.textStyle22,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  child: CustomButton(
                    loading: isLoading,
                    text: isExist ? 'Cancel Order' : 'Order now ',
                    onPressed: () async {
                      isExist ? deleteFromCart() : addToCart();
                      BlocProvider.of<ItemHandlerCubit>(context).checkExistence(
                          email: widget.email,
                          id: widget.state.products[widget.index].id!
                              .toString());
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> addToCart() async {
    isLoading = true;
    setState(() {});
    CollectionReference cart = FirebaseFirestore.instance
        .collection(widget.email + kCartCollectionReference);
    await cart.doc(widget.state.products[widget.index].id.toString()).set({
      kName: widget.state.products[widget.index].title,
      kImage: widget.state.products[widget.index].image,
      kPrice: widget.index + 1 * 123 / 4,
      kQuantity: 1,
      kId: widget.state.products[widget.index].id.toString(),
    });
    isLoading = false;
    setState(() {});
  }

  Future<void> deleteFromCart() async {
    isLoading = true;
    setState(() {});
    CollectionReference cart = FirebaseFirestore.instance
        .collection(widget.email + kCartCollectionReference);
    await cart.doc(widget.state.products[widget.index].id.toString()).delete();
    isLoading = false;
    setState(() {});
  }
}
