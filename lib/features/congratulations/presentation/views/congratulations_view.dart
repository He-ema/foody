import 'package:flutter/material.dart';
import 'package:foody/core/common/widgets/background_stack.dart';
import 'package:foody/features/congratulations/presentation/views/widgets/congratulations_view_body.dart';

class CongratulationsView extends StatelessWidget {
  const CongratulationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const BackgroundStack(
        body: CongratulationsViewBody(),
      ),
    );
  }
}
