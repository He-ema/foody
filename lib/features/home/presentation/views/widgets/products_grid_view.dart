import 'package:flutter/material.dart';

import '../../manager/products_cubit/products_cubit.dart';
import 'grid_item.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    super.key,
    required this.state,
    required this.email,
  });
  final ProductsSuccess state;
  final String email;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 200,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, //number of columns on the screen
        childAspectRatio: 0.8, // نسبىة العرض للطول
        crossAxisSpacing: 10, // spacing between columns
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return GridItem(
          state: state,
          index: index,
          email: email,
        );
      },
    );
  }
}
