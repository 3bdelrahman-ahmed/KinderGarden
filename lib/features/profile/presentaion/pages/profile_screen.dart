import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kg_sa/core/statics/app_colors.dart';
import 'package:kg_sa/core/widgets/profile_image.dart';
import 'package:kg_sa/features/profile/presentaion/widgets/erolled_courses_widget.dart';

import '../../../../core/statics/app_strings.dart';
import '../widgets/grades_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        //   fit: StackFit.expand,

        children: [
          Positioned(
            top: 0,
            child: Container(
              width: ScreenUtil.defaultSize.width,
              height: 200.h,
              child: Image.asset(
                'assets/images/aa.png', // Replace 'background_image.jpg' with your image asset
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(top: 65.h),
                width: ScreenUtil.defaultSize.width,
                height: 470.h,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1), // Shadow color
                        offset: const Offset(0, -5),
                        blurRadius: 5,
                        spreadRadius: 0,
                      ),
                    ],
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(44.h))),
                child: Column(
                  children: [
                    Text(
                      "3m Ahmed",
                      style: TextStyle(
                          fontFamily: "Baloo",
                          fontSize: 25.sp,
                          color: AppColors.splashTextColor,
                          fontWeight: FontWeight.w400),
                    ),
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.all(20.w),
                          width: 320.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(44.h)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.2), // Shadow color
                                spreadRadius: 5, // How spread the shadow is
                                blurRadius: 7, // How blurred the shadow is
                                offset:
                                    Offset(0, 2), // Changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                           EnrolledCouresWidget(),
                             
                             GradesWidget()
                            ],
                          )),
                    )
                  ],
                ),
              )),
          Positioned(
              top: 100.h,
              left: 125.w,
              right: 125.w,
              //  right: ScreenUtil.defaultSize.width/2.w,
              child: Container(
                padding: EdgeInsets.all(3.w),
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(100.w)),
                ),
                alignment: Alignment.center,
                child: ProfileImage(
                  imageUrl:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIftJBXnM23Bb5T9Iyq9Gjv_xmluu0udv9ofjRvk4SMg&s",
                  size: 90.w,
                ),
              ))
        ],
      ),
    );
  }
}
