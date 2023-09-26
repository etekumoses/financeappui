import 'dart:async';

import 'package:financialui/util/color_resources.dart';
import 'package:financialui/util/dimensions.dart';
import 'package:financialui/util/images.dart';
import 'package:financialui/view/screens/dashboard/widget/bottom_nav_item.dart';
import 'package:financialui/view/screens/history/history_screen.dart';
import 'package:financialui/view/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:financialui/view/screens/account/account_screen.dart';

class DashboardScreen extends StatefulWidget {
  final int? pageIndex;
  DashboardScreen({@required this.pageIndex});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late PageController _pageController;
  int _pageIndex = 0;
  late List<Widget> _screens;
  GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();
  bool _canExit = GetPlatform.isWeb ? true : false;

  @override
  void initState() {
    super.initState();

    _pageIndex = widget.pageIndex!;

    _pageController = PageController(initialPage: widget.pageIndex!);

    _screens = [
       HomeScreen(),
       HomeScreen(),
       HistoryScreen(),
      AccountScreen(),
    ];

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_pageIndex != 0) {
          _setPage(0);
          return false;
        } else {
          if (_canExit) {
            return true;
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Back press again to Exit'.tr,
                  style: const TextStyle(color: Colors.white)),
              behavior: SnackBarBehavior.floating,
              backgroundColor: ColorResources.getPrimaryColor(context),
              duration: const Duration(seconds: 2),
              margin: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
            ));
            _canExit = true;
            Timer(const Duration(seconds: 2), () {
              _canExit = false;
            });
            return false;
          }
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        bottomNavigationBar: BottomAppBar(
          elevation: 5,
          notchMargin: 5,
          clipBehavior: Clip.antiAlias,
          shape: const CircularNotchedRectangle(),
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
            child: Row(children: [
              BottomNavItem(
                  img: Images.home,
                  title: 'Home',
                  isSelected: _pageIndex == 0,
                  onTap: () => _setPage(0)),
              BottomNavItem(
                  title: 'Explore',
                  img: Images.explore,
                  isSelected: _pageIndex == 1,
                  onTap: () => _setPage(1)),
              BottomNavItem(
                  title: 'History',
                  img: Images.history,
                  isSelected: _pageIndex == 2,
                  onTap: () => _setPage(2)),
              BottomNavItem(
                  title: 'Account',
                  img: Images.settings,
                  isSelected: _pageIndex == 3,
                  onTap: () => _setPage(3)),
            ]),
          ),
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: _screens.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _screens[index];
          },
        ),
      ),
    );
  }

  void _setPage(int pageIndex) {
    setState(() {
      _pageController.jumpToPage(pageIndex);
      _pageIndex = pageIndex;
    });
  }
}
