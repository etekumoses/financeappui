import 'package:flutter/material.dart';
import 'package:financialui/util/dimensions.dart';
import 'package:financialui/util/styles.dart';
import 'package:financialui/view/base/fadepageroute.dart';

class MenuItem extends StatefulWidget {
  final double? cardWidth;
  final Widget? to;
  final String? label;
  final IconData? icon;
  final String? img;
  const MenuItem(
      {Key? key,
      this.cardWidth,
      this.img,
      this.to,
      this.label = "N/A",
      this.icon})
      : super(key: key);

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool isElevating = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHighlightChanged: (a) {
        setState(() {
          isElevating = !isElevating;
        });
      },
      onTap: () => Navigator.of(context).push(FadePageRoute(
        route: (context) => widget.to!,
      )),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Container(
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT + 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 3,
                blurRadius: 8,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(
                  widget.img!,
                  height: MediaQuery.of(context).size.height * .15,
                  width: MediaQuery.of(context).size.width * .15,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              Expanded(
                child: Text(widget.label!,
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

class DashboardMenuItem {
  final Widget? to;
  final String? label;
  final IconData? icon;
  final String? img;

  DashboardMenuItem({this.to, this.label, this.icon, this.img});
}
