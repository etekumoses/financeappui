import 'package:financialui/util/dimensions.dart';
import 'package:financialui/util/styles.dart';


import 'package:flutter/material.dart';


class AccountScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
   

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
           
          },
          child: CustomScrollView(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              // App Bar
              SliverAppBar(
                floating: true,
                elevation: 0,
                centerTitle: true,
                automaticallyImplyLeading: false,
                backgroundColor:Colors.transparent,
                title: Text('Account',
                    style: urbanistBold.copyWith(
                      fontSize: Dimensions.fontSizeLarge,
                      color: Colors.black,
                    )),
              ),

              const SliverToBoxAdapter(
                child: Center(
                  child: SizedBox(
                      width: Dimensions.WEB_MAX_WIDTH,
                      child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Center(child: Text("This is accounts area"))
                              ])
                       
                ),
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
