import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:rewear/Core/Provider/main_screen_provider.dart';
import 'package:rewear/Core/Server/pro_profile.dart';
import 'package:rewear/Views/Screens/Home/Main%20Screens/home.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:rewear/Views/Screens/Home/New%20User/main_page_view.dart';
import 'package:rewear/Views/Screens/Home/add_product.dart';
import 'package:rewear/Views/Screens/calendar/add_event.dart';

import 'search.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return Home();
      case 1:
        return MasonryPage();
      case 2:
        return AddCalendarEvent();
      case 3:
        return MainPageView();

      default:
        return new Text("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _getDrawerItemWidget(
        Provider.of<MainScreenProvider>(context).index,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(CupertinoIcons.add),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddProducts()));
        },
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: const [
          CupertinoIcons.home,
          CupertinoIcons.search,
          CupertinoIcons.cart,
          CupertinoIcons.at_circle
        ],
        activeIndex: Provider.of<MainScreenProvider>(context).index,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        backgroundColor: Color.fromRGBO(33, 33, 33, 1),
        inactiveColor: Colors.grey.withOpacity(0.4),

        // leftCornerRadius: 30,
        // rightCornerRadius: 30,
        activeColor: Colors.white,
        // activeColor: const Color.fromRGBO(138, 154, 91, 1),

        onTap: (value) {
          Provider.of<MainScreenProvider>(context, listen: false).updateIndex(
            index: value,
          );
        }, //other params
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.shifting,
      //   unselectedItemColor: Colors.grey,
      //   currentIndex: Provider.of<MainScreenProvider>(context).index,
      // onTap: (value) {
      //   Provider.of<MainScreenProvider>(context, listen: false).updateIndex(
      //     index: value,
      //   );
      // },
      //   items: const [
      //     BottomNavigationBarItem(
      //       label: "Home",
      //       icon: Icon(
      //         CupertinoIcons.home,
      //       ),
      //     ),
      //     BottomNavigationBarItem(
      //       label: "Calendar",
      //       icon: Icon(CupertinoIcons.calendar),
      //     ),
      //     BottomNavigationBarItem(
      //       label: "Tracker",
      //       icon: Icon(Icons.track_changes_rounded),
      //     ),
      //     BottomNavigationBarItem(
      //       label: "Explore",
      //       icon: Icon(Icons.explore),
      //     ),
      //     BottomNavigationBarItem(
      //       label: "More",
      //       icon: Icon(Icons.more_horiz_outlined),
      //     ),
      //   ],
      // ),
    );
  }
}
