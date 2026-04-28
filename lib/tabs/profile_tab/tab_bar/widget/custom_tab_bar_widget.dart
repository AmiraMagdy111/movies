import 'package:flutter/material.dart';
import 'package:movies/tabs/profile_tab/tab_bar/watch_list_tab/watch_list_tab.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/helpers/styles_manager.dart';
import '../history_tab/history_tab.dart';

class CustomTabBarWidget extends StatefulWidget {

 const  CustomTabBarWidget({super.key,});

  @override
  State<CustomTabBarWidget> createState() => _CustomTabBarWidgetState();
}

class _CustomTabBarWidgetState extends State<CustomTabBarWidget> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            onTap: (newIndex) {
              setState(() {
                index = newIndex;
              });
            },
            dividerColor: Colors.transparent,
            indicatorColor: ColorsManager.secondaryOrange,
            labelColor: ColorsManager.white,
            unselectedLabelColor: ColorsManager.secondaryOrange,
            labelStyle: StylesManager.text20Regular,
            tabs: const [
              Tab(
                icon: Icon(Icons.list,
                    color: ColorsManager.secondaryOrange),
                text: "Watch List",
              ),
              Tab(
                icon: Icon(Icons.history,
                    color: ColorsManager.secondaryOrange),
                text: "History",
              ),
            ],
          ),

          SizedBox(
            height: 400,
            child: index == 0
                ? WatchListTab(movies: [])
                : HistoryTab(history: []),
          ),
        ],
      ),
    );
  }
  }