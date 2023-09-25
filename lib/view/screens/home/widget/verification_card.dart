import 'package:financialui/util/dimensions.dart';
import 'package:flutter/material.dart';

import '../../../../util/color_resources.dart';
import '../../../../util/images.dart';
import '../../../../util/styles.dart';

class VerificationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT + 10),
        margin: EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_DEFAULT),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorResources.getSecondaryColor(context).withOpacity(.5),
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
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Phone verification',
                      style: urbanistExtraBold.copyWith(
                          fontSize: Dimensions.fontSizeDefault,
                          color: Colors.black)),
                  SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                            'To fully unlock all features and ensure the safety of your account, please complete the verification process',
                            maxLines: 4,
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
          SizedBox(
            width: 20,
          ),
          Image.asset(
            Images.approved,
            height: MediaQuery.of(context).size.height *.1,
          ),
        ]),
      ),
    );
  }
}
