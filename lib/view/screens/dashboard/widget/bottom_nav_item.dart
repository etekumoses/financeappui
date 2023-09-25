import 'package:flutter/material.dart';

import '../../../../util/color_resources.dart';
import '../../../../util/dimensions.dart';
import '../../../../util/styles.dart';

class BottomNavItem extends StatelessWidget {
  final String? img;
  final String? title;
  final Function()? onTap;
  final bool isSelected;
  BottomNavItem(
      {required this.img, this.onTap, this.isSelected = false, this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              icon: Image.asset(
                img!,
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).disabledColor,
                height: 23,
                width: 23,
              ),
              onPressed: onTap,
            ),
            Text(title!,
                style: urbanistRegular.copyWith(
                    fontSize: Dimensions.PADDING_SIZE_DEFAULT,
                    color: ColorResources.getHintColor(context))),
          ],
        ),
      ),
    );
  }
}
