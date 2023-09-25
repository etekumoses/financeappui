import 'package:financialui/util/dimensions.dart';
import 'package:flutter/material.dart';

import '../../../../util/styles.dart';

class FeatureCard extends StatelessWidget {
  final String image;
  final String title;

  const FeatureCard({super.key, required this.image, required this.title});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Container(
          width: MediaQuery.of(context).size.width * .4,
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT + 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.08),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(
                  image,
                  height: MediaQuery.of(context).size.height * .10,
                  width: MediaQuery.of(context).size.width * .10,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              Expanded(
                child: Text(title,
                    textAlign: TextAlign.center,
                    style: urbanistRegular.copyWith(
                        fontSize: 14, color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
