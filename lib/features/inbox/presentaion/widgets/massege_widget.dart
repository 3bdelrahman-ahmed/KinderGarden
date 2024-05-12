import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kg_sa/core/statics/app_colors.dart';
import 'package:kg_sa/core/widgets/profile_image.dart';

class MessageWidget extends StatelessWidget {
  final String senderName;
  final String message;
  final bool isSender; // color blue
  const MessageWidget(
      {super.key,
      required this.senderName,
      required this.message,
      required this.isSender});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.w),
      width: (MediaQuery.of(context).size.width-25.w).w,
      height: 65.h,
      decoration: BoxDecoration(
        color: isSender?AppColors.sendMessageColor:AppColors.bottomNavigationBarColor,
        borderRadius:isSender? BorderRadius.horizontal(right: Radius.circular(33.w)):BorderRadius.horizontal(left: Radius.circular(33.w)),
      ),
      child: isSender? Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
           
            Column (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    senderName,
                    style: TextStyle(
                      fontFamily: "Baloo",
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: isSender?AppColors.splashTextColor :AppColors.amberColor,
                    ),
                  ),
                  Text(
                    message,
                    style: TextStyle(
                      fontFamily: "Baloo",
                      fontSize: 13.sp,
                     // fontWeight: FontWeight.w100,
                      color: isSender?AppColors.splashTextColor :AppColors.amberColor,
                    ),
                  ),
                ],

            ),
            SizedBox(width: 10.w,),

             ProfileImage(
              imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIftJBXnM23Bb5T9Iyq9Gjv_xmluu0udv9ofjRvk4SMg&s",
            ),
        ],
      ):Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            ProfileImage(
              imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIftJBXnM23Bb5T9Iyq9Gjv_xmluu0udv9ofjRvk4SMg&s",
            ),
            SizedBox(width: 10.w,),
            Column (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    senderName,
                    style: TextStyle(
                      fontFamily: "Baloo",
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: isSender?AppColors.splashTextColor :AppColors.amberColor,
                    ),
                  ),
                  Text(
                    message,
                    style: TextStyle(
                      fontFamily: "Baloo",
                      fontSize: 13.sp,
                     // fontWeight: FontWeight.w100,
                      color: isSender?AppColors.splashTextColor :AppColors.amberColor,
                    ),
                  ),
                ],
            ),
            
        ],
      ),
    );
  }
}
