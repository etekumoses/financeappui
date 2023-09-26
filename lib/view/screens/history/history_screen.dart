import 'package:financialui/util/color_resources.dart';
import 'package:financialui/view/base/custom_button.dart';
import 'package:financialui/view/screens/account/account_screen.dart';
import 'package:financialui/view/screens/history/widget/history_card.dart';
import 'package:financialui/view/screens/home/widget/feature_card.dart';
import 'package:financialui/view/screens/home/widget/recent_activity_card.dart';
import 'package:financialui/view/screens/home/widget/top_card.dart';
import 'package:financialui/view/screens/home/widget/verification_card.dart';
import 'package:flutter/services.dart';
import 'package:financialui/util/app_constants.dart';
import 'package:financialui/util/dimensions.dart';
import 'package:financialui/util/images.dart';
import 'package:financialui/util/styles.dart';

import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List<Map<dynamic, dynamic>> historylist = [
    {
      "id": 1,
      "image": Images.profile,
      "title": "Repayment received",
      "subtitle": "Repayment received from Moses Eteku",
      "amount": 2000
    },
    {
      "id": 2,
      "image": Images.profile,
      "title": "Wallet topup",
      'subtitle': "Wallet topped up successfully",
      "amount": 5000
    },
    {
      "id": 3,
      "image": Images.profile,
      "title": "Calculate Credit Score",
      'subtitle': "Withdraw to DFCU",
      "amount": 20000
    }
  ];
  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {},
          child: CustomScrollView(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverAppBar(
                floating: false,
                elevation: 0,
                centerTitle: true,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
              ),
              SliverToBoxAdapter(
                  child: Center(
                child: SizedBox(
                    width: Dimensions.WEB_MAX_WIDTH,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                                height: Dimensions.PADDING_SIZE_LARGE),
                            Text('History',
                                style: urbanistBold.copyWith(
                                    fontSize:
                                        Dimensions.PADDING_SIZE_EXTRA_LARGE,
                                    color: Colors.black)),
                            SizedBox(
                              height: Dimensions.PADDING_SIZE_DEFAULT,
                            ),
                            Text('Yesterday',
                                style: urbanistRegular.copyWith(
                                    fontSize: Dimensions.PADDING_SIZE_DEFAULT,
                                    color:
                                        ColorResources.getHintColor(context))),
                            SizedBox(
                              height: Dimensions.PADDING_SIZE_EXTRA_SMALL + 2,
                            ),
                            new GridView.builder(
                                itemCount: historylist.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  mainAxisSpacing: 0,
                                  crossAxisSpacing: 1,
                                  childAspectRatio: 3,
                                ),
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return HistoryCard(
                                      image: historylist[index]['image'],
                                      title: historylist[index]['title'],
                                      subtitle: historylist[index]['subtitle'],
                                      amount: historylist[index]['amount']);
                                }),
                            Text('03/04/23',
                                style: urbanistRegular.copyWith(
                                    fontSize: Dimensions.PADDING_SIZE_DEFAULT,
                                    color:
                                        ColorResources.getHintColor(context))),
                            SizedBox(
                              height: Dimensions.PADDING_SIZE_EXTRA_SMALL + 2,
                            ),
                            new GridView.builder(
                                itemCount: historylist.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  mainAxisSpacing: 0,
                                  crossAxisSpacing: 1,
                                  childAspectRatio: 3,
                                ),
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return HistoryCard(
                                      image: historylist[index]['image'],
                                      title: historylist[index]['title'],
                                      subtitle: historylist[index]['subtitle'],
                                      amount: historylist[index]['amount']);
                                }),
                          ]),
                    )),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class SliverDelegate extends SliverPersistentHeaderDelegate {
  Widget child;

  SliverDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(SliverDelegate oldDelegate) {
    return oldDelegate.maxExtent != 50 ||
        oldDelegate.minExtent != 50 ||
        child != oldDelegate.child;
  }
}
