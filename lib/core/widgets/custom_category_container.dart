import 'package:flutter/material.dart';
import 'package:kg_sa/core/statics/app_colors.dart';

class CustomCategoryCotainerWidget extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final Widget widget;
   double? padding;
   CustomCategoryCotainerWidget(
      {super.key,
      required this.width,
      required this.height,
      required this.radius,
      required this.widget,
      this.padding,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(start: padding ?? 0 , end: padding ?? 0),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.horizontal(left: Radius.circular(radius),right: Radius.circular(radius)),
        color: AppColors.bottomNavigationBarColor

      ),
      alignment: Alignment.center,
      child: widget,
    );
  }
}
