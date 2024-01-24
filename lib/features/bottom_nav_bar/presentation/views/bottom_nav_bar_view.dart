import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foody/constants.dart';
import 'package:foody/core/common/cubits/auth_cubit/auth_cubit.dart';
import 'package:foody/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:foody/features/chat/presentation/views/chat_view.dart';
import 'package:foody/features/home/presentation/views/home_view.dart';
import 'package:foody/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../cart/presentation/views/cart_view.dart';
import '../../../profile/presentation/views/profile_view.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    views = [
      HomeView(email: BlocProvider.of<AuthCubit>(context).email!),
      BlocProvider(
        create: (context) => ProfileCubit()
          ..getUserData(BlocProvider.of<AuthCubit>(context).email!),
        child: ProfileView(email: BlocProvider.of<AuthCubit>(context).email!),
      ),
      BlocProvider(
        create: (context) => CartCubit()
          ..getAllCartItems(email: BlocProvider.of<AuthCubit>(context).email!),
        child: CartView(email: BlocProvider.of<AuthCubit>(context).email!),
      ),
      const ChatView(),
    ];

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
            icon: FontAwesomeIcons.comment,
            text: 'Chat',
            padding: EdgeInsets.all(15),
          ),
        ],
      ),
    );
  }
}
