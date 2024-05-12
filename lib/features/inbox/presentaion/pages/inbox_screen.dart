import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kg_sa/core/statics/app_strings.dart';
import 'package:kg_sa/features/inbox/presentaion/widgets/massege_widget.dart';

import '../../../../core/statics/app_colors.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 22.h, left: 10.w),
            child: Text(
              AppStrings.inbox,
              style: TextStyle(
                fontSize: 32.sp,
                fontFamily: "Baloo",
                fontWeight: FontWeight.w400,
                color: AppColors.amberColor,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: Stack(
              children: [
                Expanded(
                  child: Center(
                    child: Container(
                      width: 345.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(0, -5),
                            blurRadius: 5,
                            spreadRadius: 0,
                          ),
                        ],
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(44.h),
                        ),
                      ),
                      padding: EdgeInsets.all(10.w),
                      child: Expanded(
                        child: Container(
                          width: 325.w,
                          decoration: BoxDecoration(
                            color: AppColors.splashTextColor,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(30.h),
                            ),
                          ),
                          padding: EdgeInsets.only(top: 30.h),
                          child: Column(
                            children: [
                            MessageWidget(
                          senderName: "3m Ahmed",
                          message: "message",
                          isSender: false),
                        SizedBox(height: 10.h,),
                                             MessageWidget(
                          senderName: "3m Ahmed",
                          message: "message",
                          isSender: true)
                            ],
                          ) ,
                        ),
                      ),
                      
                    ),
                  ),
                ),
               
              ],
            ),
          ),
        ],
      ),
    );
  }
}
