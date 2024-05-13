import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kg_sa/core/statics/app_colors.dart';
import 'package:kg_sa/core/widgets/custom_image_view.dart';
import 'package:kg_sa/features/profile/data/models/courses_model.dart';

class CourseWidget extends StatelessWidget {
  final Course  course;
  const CourseWidget({super.key, required this.course,});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
          CustomImageView(
            svgPath: "assets/svgs/C1.svg",
            height: 35.h,
            width: 35.w,
            color: AppColors.categoryTextColor,
          ),
          Center(
            child: Text(course.name!,
            style: TextStyle(
              fontSize: 17.sp,
              fontFamily: "Baloo",
              fontWeight: FontWeight.w400,
              color: AppColors.categoryTextColor,
            ),
            ),
          )
      ],
    );
  }
}