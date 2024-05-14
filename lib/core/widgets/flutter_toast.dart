
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kg_sa/core/widgets/custom_image_view.dart';

void showToast(BuildContext context,String message,Color color ) {
    FToast fToast = FToast();
    fToast.init(context);
    
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: color,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
            CustomImageView(
            imagePath: "assets/images/splashIcon.png",
            width: 40.w,
            height: 40.h,
          ),
         const  SizedBox(width: 10),
          Text(message
          ,
          style:  TextStyle(
            fontFamily: "Cairo",
            fontWeight: FontWeight.bold,
            fontSize: 8.sp
          ),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 3),
    );
  }