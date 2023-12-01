import 'package:flutter/material.dart';
import 'package:foody/constants.dart';
import 'package:foody/core/common/widgets/background_stack.dart';
import 'package:foody/core/common/widgets/custom_button.dart';
import 'package:foody/core/utils/app_router.dart';
import 'package:foody/core/utils/styles.dart';
import 'package:go_router/go_router.dart';

import '../../../data/onBoarding_model.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const BackgroundStack(
      body: OnBoadrdingPageView(),
    );
  }
}

class OnBoadrdingPageView extends StatefulWidget {
  const OnBoadrdingPageView({super.key});

  @override
  State<OnBoadrdingPageView> createState() => _OnBoadrdingPageViewState();
}

class _OnBoadrdingPageViewState extends State<OnBoadrdingPageView> {
  int currentIndex = 0;
  final PageController _controller = PageController(initialPage: 0);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _controller,
            itemCount: onBoardList.length,
            onPageChanged: (value) {
              currentIndex = value;
              setState(() {});
            },
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  onBoardList[index].images,
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kHorizontalPadding),
                    child: Text(
                      onBoardList[index].title,
                      style: Styles.textStyle22,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kHorizontalPadding),
                    child: Text(
                      onBoardList[index].description,
                      style: Styles.textStyle15,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            onBoardList.length,
            (i) => buildDot(i),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.35,
            height: 55,
            child: CustomButton(
              text: 'Next',
              onPressed: () {
                if (currentIndex == onBoardList.length - 1) {
                  GoRouter.of(context).pushReplacement(AppRouter.signInRoute);
                } else {
                  _controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear);
                }
              },
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Container buildDot(int index) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: currentIndex == index ? 25 : 10,
      height: 10,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
