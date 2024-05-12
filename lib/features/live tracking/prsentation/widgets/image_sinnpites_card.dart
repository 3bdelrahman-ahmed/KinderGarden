import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kg_sa/core/statics/app_colors.dart';

class ImageSnipptesCard extends StatelessWidget {
  const ImageSnipptesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 140.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.horizontal(left: Radius.circular(15.w),right: Radius.circular(15.w)),
          color: AppColors.amberColor,
      ),
    );
  }
}