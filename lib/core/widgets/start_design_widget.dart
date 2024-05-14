import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kg_sa/core/widgets/custom_image_view.dart';
import 'package:lottie/lottie.dart';

import '../../features/splash/presentaion/widgets/rainbow_text_widget.dart';
import '../statics/app_colors.dart';
import '../statics/app_strings.dart';

class StartDesignWidget extends StatelessWidget {
  const StartDesignWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: "assets/images/splashIcon.png",
            width: 300.w,
            height: 200.h,
          ),
        
          Stack(
            children: [
              // Text with stroke
              Text(
                AppStrings.splashText,
                style: TextStyle(
                  fontFamily: "Baloo",
                  fontSize: 30.sp,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 8.5
                    ..strokeCap = StrokeCap.round
                    ..color =
                        AppColors.amberColor  , // Set the color of the text border
                  fontWeight: FontWeight.w600,
                ),
              ),
              // Text without stroke (inside)
              Text(
                AppStrings.splashText,
                style: TextStyle(
                  fontFamily: "Baloo",
                  fontSize: 30.sp,
                  color: Colors.white, // Set the color of the text inside
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text.rich(
                TextSpan(
                  
                  children: [
                     TextSpan(
                      
                      text: 'Where Every Day is a ',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.splashTextColor,
                        fontFamily: "Baloo",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    getRainbowText(),
                     TextSpan(
                      text: ' Adventure',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.splashTextColor,
                        fontFamily: "Baloo",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text("for your Child!",
          style: TextStyle(
             fontSize: 12.sp,
                        color: AppColors.splashTextColor,
                        fontFamily: "Baloo",
                        fontWeight: FontWeight.w400,
          ),
          )
        ],
      );
  }
}