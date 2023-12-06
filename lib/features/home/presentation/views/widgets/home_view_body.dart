import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foody/constants.dart';
import 'package:foody/core/utils/styles.dart';
import 'package:foody/features/home/presentation/manager/products_cubit/products_cubit.dart';
import 'package:foody/features/home/presentation/views/widgets/auto_slidable_cards.dart';
import 'package:foody/features/home/presentation/views/widgets/products_grid_view.dart';
import 'my_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return CustomScrollView(
            slivers: [
              const MyAppBar(),
              SliverToBoxAdapter(
                child: AutoSlidableCards(),
              ),
              ProductsGridView(
                state: state,
              )
            ],
          );
        } else if (state is ProductsFailure) {
          return Center(
            child: Text(state.errorMessage, style: Styles.textStyle25),
          );
        } else {
          return const Center(
            child: SpinKitWave(
              color: kPrimaryColor,
            ),
          );
        }
      },
    );
  }
}
