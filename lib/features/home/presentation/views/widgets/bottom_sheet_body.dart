import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/widgets/custom_button.dart';
import '../../../../../core/utils/styles.dart';
import '../../manager/products_cubit/products_cubit.dart';

class BottomSheetBody extends StatelessWidget {
  const BottomSheetBody({
    super.key,
    required this.state,
    required this.index,
  });

  final ProductsSuccess state;
  final int index;

  @override
  Widget build(BuildContext context) {
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
                    imageUrl: state.products[index].image!,
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
                      state.products[index].title!,
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
                  '${(index + 1 * 123 / 4 + 20)}\$',
                  style: Styles.textStyle22.copyWith(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey),
                ),
                Text(
                  '${(index + 1 * 123 / 4)}\$',
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
                text: 'Order now ',
                onPressed: () {},
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
