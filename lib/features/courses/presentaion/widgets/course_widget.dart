import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kg_sa/core/statics/app_cashing.dart';
import 'package:kg_sa/core/statics/app_colors.dart';
import 'package:kg_sa/core/statics/app_strings.dart';
import 'package:kg_sa/features/courses/domain/cubit/enroll_cubit.dart';

import '../../../profile/data/models/courses_model.dart';

class ViewCourseWidget extends StatelessWidget {
  final Course course;
  const ViewCourseWidget({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      width: 290.w,
      height: 120.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.horizontal(
            left: Radius.circular(30.w), right: Radius.circular(30.w)),
        color: AppColors.splashTextColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Course : ${course.name}",
            style: TextStyle(
              fontFamily: "Baloo",
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          Text(
            "Teacher Name : ${course.teacherName}",
            style: TextStyle(
              fontFamily: "Baloo",
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 18, 59, 100),
            ),
          ),
          course.isSelected!
              ? Center(
                  child: Text(
                  "Requested to Enroll this course",  
                  style: TextStyle(
                      fontFamily: "Baloo",
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.error),
                ))
              : Center(
                  child: BlocConsumer<EnrollCubit, EnrollState>(
                    listener: (context, state) {
                      print(state);
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          print("aaaaaaaa-------?${course.id}");
                          context.read<EnrollCubit>().enrollCourse(
                              context,
                              AppColors.error,
                              AppCashingService.token,
                              EnrollCourseParameters(courseId: course.id!));
                        },
                        child: Container(
                            width: 50.w,
                            height: 35.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(10.w),
                                  right: Radius.circular(10.w)),
                              color: Color.fromARGB(255, 18, 59, 100),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              AppStrings.enroll,
                              style: TextStyle(
                                fontFamily: "Baloo",
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            )),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
