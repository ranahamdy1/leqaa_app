import 'package:flutter/material.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/features/home/views/chat/view/chat_screen.dart';
import 'package:leqaa_app/features/home/views/favourite/view/favourite_screen.dart';
import 'package:leqaa_app/features/home/views/home/view/home_screen.dart';
import 'package:leqaa_app/features/home/views/main_navigation/widget/selection_icon_widget.dart';
import 'package:leqaa_app/features/home/views/main_profile/views/main_profile_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<MainNavigationScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: NavigationBar(
            backgroundColor: Colors.transparent,
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            indicatorColor: AppColors.whiteColor,
            selectedIndex: currentPageIndex,
            destinations: <Widget>[
              NavigationDestination(
                selectedIcon: SelectionIconWidget(
                  onPressed: () {
                    setState(() {
                      currentPageIndex = 0;
                    });
                  },
                  imageText: 'home',
                  text: 'الرئيسية',
                ),
                icon: SizedBox(
                  height: 22,
                  width: 22,
                  child: Image.asset("home".getPngAsset),
                ),
                label: '',
              ),
              NavigationDestination(
                selectedIcon: SelectionIconWidget(
                  onPressed: () {
                    setState(() {
                      currentPageIndex = 1;
                    });
                  },
                  imageText: 'chat',
                  text: 'الرسائل',
                ),
                icon: Image.asset("chat".getPngAsset),
                label: '',
              ),
              NavigationDestination(
                selectedIcon: SelectionIconWidget(
                  onPressed: () {
                    setState(() {
                      currentPageIndex = 2;
                    });
                  },
                  imageText: 'heart',
                  text: 'المفضلة',
                ),
                icon: Image.asset("heart".getPngAsset),
                label: '',
              ),
              NavigationDestination(
                selectedIcon: SelectionIconWidget(
                  onPressed: () {
                    setState(() {
                      currentPageIndex = 3;
                    });
                  },
                  imageText: 'profile',
                  text: 'الملف الشخصي',
                ),
                icon: Image.asset("profile".getPngAsset),
                label: '',
              ),
            ],
          ),
        ),
        body: <Widget>[
          const HomeScreen(),
          const ChatScreen(),
          const FavouriteScreen(),
          MainProfileScreen(),
          //const ProfileScreen(),
        ][currentPageIndex],
      ),
    );
  }
}
