import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kg_sa/core/statics/app_colors.dart';
import 'package:kg_sa/core/widgets/custom_image_view.dart';

class TitleWidget extends StatelessWidget {
  final String text ;
  final String image;
  const TitleWidget({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(start: 17.w,end: 17.w ),
      width: 320.w,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.horizontal(left: Radius.circular(45.w),right: Radius.circular(45.w)),
        color: AppColors.amberColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            Text(text,
            style: TextStyle(
              fontFamily: "Baloo",
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.primaryColor,
            ),
            ),
            CustomImageView(
              svgPath: image,
              width: 25.w,
              height: 25.h,
            )
        ],
      ),
    );
  }
}