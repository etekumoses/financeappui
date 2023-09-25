import 'package:financialui/util/color_resources.dart';
import 'package:financialui/view/base/custom_button.dart';
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List<Map<dynamic, dynamic>> featurelist = [
    {"id": 1, "image": Images.loan, "title": "Loan Application"},
    {"id": 2, "image": Images.payment, "title": "Add Payment Account"},
    {"id": 3, "image": Images.score, "title": "Calculate Credit Score"}
  ];

  List<Map<dynamic, dynamic>> recentactivitylist = [
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
                                height:
                                    Dimensions.PADDING_SIZE_EXTRA_LARGE + 20),

                            Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Hello Shamos 👋',
                                      style: urbanistExtraBold.copyWith(
                                          fontSize:
                                              Dimensions.PADDING_SIZE_LARGE + 2,
                                          color: Colors.black)),
                                  Image.asset(
                                    Images.notification,
                                    scale: 20,
                                  ),
                                ]),

                            SizedBox(
                              height: Dimensions.PADDING_SIZE_EXTRA_LARGE + 4,
                            ),
                            // top card here
                            TopCard(),
                            const SizedBox(
                                height: Dimensions.PADDING_SIZE_LARGE),

                            // features
                            Text('Quick Features',
                                style: urbanistBold.copyWith(
                                    fontSize: Dimensions.PADDING_SIZE_DEFAULT,
                                    color: Colors.black)),
                            Container(
                              height: MediaQuery.of(context).size.height * .2,
                              child: ListView.builder(
                                  itemCount: featurelist.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, i) {
                                    return FeatureCard(
                                        image: featurelist[i]['image'],
                                        title: featurelist[i]['title']);
                                  }),
                            ),

                            SizedBox(
                              height: Dimensions.PADDING_SIZE_LARGE - 10,
                            ),
                            // verification card
                            VerificationCard(),
                            const SizedBox(
                                height: Dimensions.PADDING_SIZE_LARGE),
                            // recent activity
                            Text('Recent Activity',
                                style: urbanistBold.copyWith(
                                    fontSize: Dimensions.PADDING_SIZE_DEFAULT,
                                    color: Colors.black)),
                            SizedBox(
                              height: Dimensions.PADDING_SIZE_EXTRA_SMALL + 2,
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
                                itemCount: recentactivitylist.length,
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
                                  return RecentActivityCard(
                                      image: recentactivitylist[index]['image'],
                                      title: recentactivitylist[index]['title'],
                                      subtitle: recentactivitylist[index]
                                          ['subtitle'],
                                      amount: recentactivitylist[index]
                                          ['amount']);
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
