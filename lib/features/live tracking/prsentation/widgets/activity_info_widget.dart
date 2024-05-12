import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kg_sa/core/statics/app_colors.dart';
import 'package:kg_sa/core/widgets/profile_image.dart';

import '../../../../core/utils/string_formatter.dart';

class ActivityInfoWidget extends StatelessWidget {
  const ActivityInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileImage(
          imageUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIftJBXnM23Bb5T9Iyq9Gjv_xmluu0udv9ofjRvk4SMg&s",
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'parsed time',
              style: TextStyle(
                  fontSize: 10.sp,
                  color: AppColors.amberColor,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Cairo"),
            ),
            Text(
              formatString(
                  "Emillie is having Language Lullabies class rightnow"),
              style: TextStyle(
                  color: AppColors.amberColor,
                  fontFamily: "Baloo",
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w400),
            ),
          ],
        )
      ],
    );
  }
}
