import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:financialui/util/dimensions.dart';
import 'package:financialui/util/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBackButtonExist; 
   final void Function()? onBackPressed;

  final bool showCart;

  CustomAppBar({
    required this.title,
    this.isBackButtonExist = true,
     this.onBackPressed,
    this.showCart = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: urbanistBold.copyWith(
          fontSize: Dimensions.fontSizeLarge,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      leading: isBackButtonExist
          ? IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Theme.of(context).textTheme.bodyText1!.color,
                    onPressed: () => onBackPressed != null
                        ? onBackPressed
                        : Navigator.pop(context),
                  )
          : SizedBox(),
      backgroundColor: Theme.of(context).cardColor,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize =>
      Size(Dimensions.WEB_MAX_WIDTH, GetPlatform.isDesktop ? 70 : 50);
}
