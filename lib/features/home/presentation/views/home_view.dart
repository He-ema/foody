import 'package:flutter/material.dart';
import 'package:foody/core/common/widgets/background_stack.dart';
import 'package:foody/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const BackgroundStack(
        body: HomeViewBody(),
        isBig: false,
      ),
    );
  }
}
