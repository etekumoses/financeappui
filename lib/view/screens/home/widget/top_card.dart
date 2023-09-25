import 'package:financialui/util/images.dart';
import 'package:flutter/material.dart';

import '../../../../util/color_resources.dart';
import '../../../../util/dimensions.dart';
import '../../../../util/styles.dart';
import '../../../base/custom_button.dart';
class TopCard extends StatefulWidget {
  const TopCard({super.key});

  @override
  State<TopCard> createState() => _TopCardState();
}

class _TopCardState extends State<TopCard> {

bool hide = false;

showhide(){
 setState(() {
    hide = !hide;
 });
}
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
      margin: const EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorResources.getPrimaryColor(context),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 8,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Wallet Balance',
                    style: urbanistRegular.copyWith(
                        fontSize: Dimensions.PADDING_SIZE_DEFAULT - 2,
                        color: ColorResources.getWhiteColor(context))),
                InkWell(
                  onTap: (){
                    showhide();
                  },
                  child: Container(
                      width: 30,
                      height: 30,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorResources.getWhiteColor(context),
                      ),
                      child: Center(
                        child: Image.asset(
                         hide == false? Images.hide: Images.show,
                          width: 15,
                          height: 15,
                        ),
                      )),
                )
              ],
            ),
            const SizedBox(height: Dimensions.PADDING_SIZE_SMALL - 5),
            InkWell(
              onTap: () {
                showhide();
              },
              child: Text(
               hide== false ? 'UGX 2,000,000' : 'Tap to show',
                style: urbanistBlack.copyWith(
                    fontSize: hide == false ?  Dimensions.fontSizeExtraLarge + 4 : Dimensions.fontSizeSmall,
                    color: ColorResources.getWhiteColor(context)),
              ),
            ),
            const SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Align buttons in a row
              children: [
                CustomButton(
                  onTap: () {},
                  btnTxt: 'Fund Wallet',
                  width: MediaQuery.of(context).size.width * .38,
                  buttonColor: ColorResources.getWhiteColor(context),
                  textColor: ColorResources.getPrimaryColor(context),
                ),
                CustomButton(
                  onTap: () {},
                  btnTxt: 'Withdraw',
                  width: MediaQuery.of(context).size.width * .38,
                  buttonColor: ColorResources.getPrimaryColor(context),
                  textColor: ColorResources.getWhiteColor(context),
                  borderColor: ColorResources.getWhiteColor(context),
                  isShowBorder: true,
                ),
              ],
            ),
          ]),
    );
  }
}
