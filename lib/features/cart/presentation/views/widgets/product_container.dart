import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../manager/cart_cubit/cart_cubit.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    super.key,
    required this.state,
    required this.index,
    required this.startAnimation,
  });
  final CartSuccess state;
  final int index;
  final bool startAnimation;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(
          startAnimation ? 0 : MediaQuery.of(context).size.width, 0, 0),
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300 + (index * 250)),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(width: 0.2, color: kPrimaryColor),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
                height: 100, imageUrl: state.cartItems[index].image),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(
                  state.cartItems[index].name,
                  style:
                      Styles.textStyle20.copyWith(fontWeight: FontWeight.w500),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    state.cartItems[index].price.toString() + '\$',
                    style: Styles.textStyle22.copyWith(
                        color: kPrimaryColor, fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.10,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: kPrimaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.remove,
                          color: kPrimaryColor,
                        ),
                      ),
                      Text(
                        state.cartItems[index].quantity.toString(),
                        style: Styles.textStyle22,
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
