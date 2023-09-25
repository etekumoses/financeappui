import 'package:financialui/util/dimensions.dart';
import 'package:flutter/material.dart';

import '../../../../util/color_resources.dart';
import '../../../../util/images.dart';
import '../../../../util/styles.dart';

class RecentActivityCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final int amount;

  const RecentActivityCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.amount,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child:Container(
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT + 10),
          margin: EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_DEFAULT),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(
                image,
                // scale: 20,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(title,
                            style: urbanistRegular.copyWith(
                                fontSize: Dimensions.fontSizeDefault,
                                color: Colors.black)),
                        Text('UGX $amount',
                            style: urbanistRegular.copyWith(
                                fontSize: Dimensions.fontSizeSmall,
                                color:
                                    ColorResources.getSuccessColor(context))),
                      ],
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                    Row(
                      children: [
                        Flexible(
                          child: Text(subtitle,
                              maxLines: 2,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: urbanistRegular.copyWith(
                                  fontSize: Dimensions.fontSizeSmall,
                                  color: Theme.of(context).disabledColor)),
                        ),
                      ],
                    ),
                  ]),
            ),
          ]),
        ),
      
    );
  }
}
