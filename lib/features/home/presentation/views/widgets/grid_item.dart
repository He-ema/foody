import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foody/core/utils/styles.dart';
import 'package:foody/features/home/presentation/manager/item_handler_cubit/item_handler_cubit.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/widgets/custom_button.dart';
import '../../manager/products_cubit/products_cubit.dart';
import 'bottom_sheet_body.dart';

class GridItem extends StatelessWidget {
  const GridItem({
    super.key,
    required this.state,
    required this.index,
    required this.email,
  });

  final ProductsSuccess state;
  final int index;
  final String email;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15), topLeft: Radius.circular(15))),
          context: context,
          builder: (context) {
            return BlocProvider(
              create: (context) => ItemHandlerCubit()
                ..checkExistence(email: email, id: state.products[index].id!),
              child: BottomSheetBody(
                state: state,
                index: index,
                email: email,
              ),
            );
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  color: Colors.grey.withOpacity(0.2),
                  offset: const Offset(5, 4))
            ]),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
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
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Text(
                state.products[index].title!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Text(
                '${(index + 1 * 123 / 4)} \$',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
