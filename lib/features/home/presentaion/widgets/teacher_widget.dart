import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kg_sa/core/statics/app_colors.dart';
import 'package:kg_sa/core/widgets/custom_image_view.dart';
import 'package:kg_sa/features/home/data/models/teacher_model.dart';

class TeacherWidget extends StatelessWidget {
  final Teacher teacherInfo;
  const TeacherWidget({super.key, required this.teacherInfo});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      width: 325.w,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(10.w),
                width: 325.w,
                height: 100.h,
                decoration: BoxDecoration(
                    color: AppColors.splashTextColor,
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(30.w),
                        right: Radius.circular(30.w))),
                // alignment: Alignment.centerLeft,
                child: Row(
                  //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 80.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                          // color: Colors.amber,
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(30.w),
                              right: Radius.circular(30.w))),
                      child: ClipRRect(
                        borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(20.w),
                            right: Radius.circular(20.w)),
                        child: Image.network(
                            fit: BoxFit.cover,
                            teacherInfo.profilePicture!
                            ),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                   //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          teacherInfo.name!,
                          style: TextStyle(
                              color: AppColors.categoryTextColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Baloo"),
                        ),
                        SizedBox(height: 15.h,),
                        Text(
                          "Course",
                          style: TextStyle(
                              color: AppColors.teacherCourseColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Baloo"),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              bottom: 0,
              right: 10.w,
              child: Container(
                padding: EdgeInsetsDirectional.only(start: 10.w, end: 10.w),
                width: 200.w,
                height: 40.h,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // Shadow color
                      spreadRadius: 0, // How spread the shadow is
                      blurRadius: 4, // How blurred the shadow is
                      offset: Offset(0, 4), // Changes position of shadow
                    ),
                  ],
                  color: AppColors.amberColor,
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(20.w),
                      right: Radius.circular(20.w)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Request Communication",
                      style: TextStyle(
                          fontFamily: "Baloo",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.categoryTextColor),
                    ),
                    CustomImageView(
                      svgPath: "assets/svgs/commu.svg",
                      width: 25.w,
                      height: 25.w,
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
