import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/constants.dart';
import 'package:foody/core/common/cubits/auth_cubit/auth_cubit.dart';
import 'package:foody/features/home/presentation/views/home_view.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigationBarView extends StatefulWidget {
  const BottomNavigationBarView({
    super.key,
  });

  @override
  State<BottomNavigationBarView> createState() =>
      _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState extends State<BottomNavigationBarView> {
  int currentIndex = 0;

  late List views;
  late String email;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    views = [
      const HomeView(),
      Container(),
      Container(),
      Container(),
    ];
    email = BlocProvider.of<AuthCubit>(context).email!;
    AuthCubit().close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: views.elementAt(currentIndex),
      bottomNavigationBar: GNav(
        onTabChange: (value) {
          currentIndex = value;
          setState(() {});
        },
        tabBackgroundColor: kPrimaryColor.withOpacity(0.1),
        activeColor: kPrimaryColor,
        tabMargin: const EdgeInsets.all(10),
        gap: 8,
        color: kPrimaryColor.withOpacity(0.3),
        tabBorderRadius: 15,
        backgroundColor: Theme.of(context).colorScheme.primary,
        padding: const EdgeInsets.all(40),
        curve: Curves.easeInQuart,
        // ignore: prefer_const_literals_to_create_immutables
        tabs: [
          const GButton(
            icon: Icons.home,
            text: 'Home',
            padding: EdgeInsets.all(15),
          ),
          const GButton(
            icon: Icons.person,
            text: 'Profile',
            padding: EdgeInsets.all(15),
          ),
          const GButton(
            icon: Icons.shopping_cart,
            text: 'Cart',
            padding: EdgeInsets.all(15),
          ),
          const GButton(
            icon: Icons.wallet,
            text: 'Payment',
            padding: EdgeInsets.all(15),
          ),
        ],
      ),
    );
  }
}
