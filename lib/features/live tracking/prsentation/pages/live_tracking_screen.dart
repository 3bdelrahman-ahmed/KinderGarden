import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kg_sa/core/statics/app_colors.dart';
import 'package:kg_sa/core/statics/app_strings.dart';

import '../../../../core/widgets/bottom_nav_bar.dart';
import '../widgets/current_activity_widget.dart';
import '../widgets/video_widget.dart';


class liveTrackingScreen extends StatelessWidget {
  final int ind;
  const liveTrackingScreen({super.key, required this.ind});

  @override
  Widget build(BuildContext context) {
    List <Widget> screenContent =[
        VideoWidget(),
        CurrentActivityWidget(),
    ];
    return Scaffold(
    //  bottomNavigationBar: BottomNavigationBarWidget(),
      backgroundColor: AppColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 22.h, left: 10.w),
            child: Text(
              AppStrings.liveTracking,
              style: TextStyle(
                color: AppColors.amberColor,
                fontFamily: "Baloo",
                fontSize: 32.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: 7.h,
          ),
          Expanded(
            child: Center(
              child: Container(
                width: 345.w,
                decoration: BoxDecoration(
                    color: Colors.white,
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
                padding: EdgeInsets.all(10.w),
                // i want to wrap this column with scorll widget but it give exception it should have size
                child:  screenContent[ind],
                
              ),
            ),
          ),
        ],
      ),
     
    );
  }
}
