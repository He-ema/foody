import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:foody/features/home/presentation/views/widgets/auto_slidable_cards.dart';
import 'my_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const MyAppBar(),
        SliverToBoxAdapter(
          child: AutoSlidableCards(),
        ),
        SliverGrid.builder(
          itemCount: 200,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, //number of columns on the screen
            childAspectRatio: 1.1, // نسبىة العرض للطول
            // crossAxisSpacing: 10, // spacing between columns
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return Container(
              height: 100,
              color: Colors.red,
              margin: EdgeInsets.all(5),
            );
          },
        ),
        // SliverFillRemaining(
        //   child: MasonryGridView.builder(
        //     padding: EdgeInsets.zero,
        //     physics: const NeverScrollableScrollPhysics(),
        //     itemCount: 200,
        //     gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        //         crossAxisCount: 2),
        //     itemBuilder: (context, index) => Container(
        //       margin: const EdgeInsets.all(10),
        //       color: Colors.grey,
        //       height: 50,
        //       child: Text(index.toString()),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
