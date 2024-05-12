import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kg_sa/core/statics/app_colors.dart';
import 'package:kg_sa/core/statics/app_strings.dart';
import 'package:kg_sa/core/widgets/custom_category_container.dart';
import 'package:kg_sa/core/widgets/custom_image_view.dart';

import '../../../../core/utils/navigation_utils.dart';
import '../../../live tracking/prsentation/pages/live_tracking_screen.dart';

class liveTrackingWidget extends StatelessWidget {
  const liveTrackingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> _strings = [
      AppStrings.videoSnip,
      AppStrings.currentActivity,
    ];

    List<String> PICs = ["assets/svgs/PC.svg", "assets/svgs/timer.svg"];

    List<Widget> screens = [
      liveTrackingScreen(ind: 0,),
      liveTrackingScreen(ind: 1,),
    ];
    return Container(
      padding: EdgeInsets.all(10.w),
      width: 345.w,
      height: 155.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(45.w),
          right: Radius.circular(45.w),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Shadow color
            offset: const Offset(0, -5),
            blurRadius: 5,
            spreadRadius: 0,
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
              _strings.length,
              (index) => GestureDetector(
                    onTap: () {
                      FlutterUtils.push(context, screens[index]);
                    },
                    child: CustomCategoryCotainerWidget(
                        width: 160.w,
                        height: 120.h,
                        radius: 33.w,
                        widget: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomImageView(
                              svgPath: PICs[index],
                              width: 55.w,
                              height: 48.h,
                            ),
                            Text(
                              _strings[index],
                              style: TextStyle(
                                fontFamily: "Baloo",
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.categoryTextColor,
                              ),
                            ),
                          ],
                        ),
                        ),
                  ))),
    );
  }
}
