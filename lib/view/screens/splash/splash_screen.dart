import 'dart:async';

import 'package:financialui/util/dimensions.dart';
import 'package:financialui/util/images.dart';
import 'package:financialui/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helper/route_helper.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () async {
      Get.offNamed(RouteHelper.getInitialRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Kaloan',
          style: urbanistBold.copyWith(
              fontSize: Dimensions.fontSizeSmall, color: Colors.white),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    )));
  }
}
