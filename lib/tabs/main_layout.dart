import 'package:flutter/material.dart';
import 'package:movies/core/theming/colors_manager.dart';
import 'package:movies/features/profile/profile_screen.dart';
import '../core/assets_image/app_assets.dart';
import '../tabs/home_tab/home_tab.dart';
import 'search_tab/search_tab.dart';
class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}
class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;
  final List<Widget> tabs = [
    HomeTab(),
    SearchTab(),
    SearchTab(),
   ProfileScreen()
  ];

  final List<List<String>> tabIcons = [
    [IconsManager.homeIcon, IconsManager.exploreIconSelected],
    [IconsManager.searchIcon, IconsManager.searchIconSelected],
    [IconsManager.exploreIcon, IconsManager.exploreIconSelected],
    [IconsManager.profileIcon, IconsManager.profileIconSelected],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorsManager.primaryBlack,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: List.generate(4, (index) {
          return BottomNavigationBarItem(
            icon: Image.asset(
              currentIndex == index
                  ? tabIcons[index][1]
                  : tabIcons[index][0],
              width: 24,
              height: 24,
            ),
            label: ["Home", "Search", "Browse", "Profile"][index],
          );
        }),
      ),
    );
  }
}