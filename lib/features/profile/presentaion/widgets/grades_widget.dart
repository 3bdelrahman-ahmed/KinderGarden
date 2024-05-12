import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kg_sa/core/statics/app_colors.dart';
import 'package:kg_sa/core/widgets/custom_category_container.dart';

import '../../../../core/statics/app_strings.dart';

class GradesWidget extends StatelessWidget {
  const GradesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.grdes,
          style: TextStyle(
            fontSize: 28.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.amberColor,
            fontFamily: "Baloo",
          ),
        ),
        Container(
            width: 300.w,
            height: 140.h,
            child: ListView.separated(
              padding: EdgeInsets.zero,
                itemBuilder: ((context, index) {
                  return CustomCategoryCotainerWidget(
                    padding: 10.w,
                    width: 290.w,
                    height: 35.h,
                    radius: 10.w,
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Maths",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.categoryTextColor,
                            fontFamily: "Baloo",
                          ),
                        ),
                        Text(
                          "10/10",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.categoryTextColor,
                            fontFamily: "Baloo",
                          ),
                        )
                      ],
                    ),
                  );
                }),
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 5.h,
                  );
                },
                itemCount: 5)),
      ],
    );
  }
}
