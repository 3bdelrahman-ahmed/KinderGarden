import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kg_sa/core/statics/app_cashing.dart';
import 'package:kg_sa/features/profile/domain/cubit/profile_cubit.dart';

import '../../../../core/statics/app_colors.dart';
import '../../../../core/statics/app_strings.dart';
import '../widgets/course_widget.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  @override
  void initState(){
    super.initState();
    context.read<ProfileCubit>().getAllCourses(context, AppColors.error, AppCashingService.token);
  }
  @override
  Widget build(BuildContext context) {
    var courseCubit= context.read<ProfileCubit>();
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 22.h, left: 10.w),
            child: Text(
              AppStrings.courses,
              style: TextStyle(
                fontSize: 32.sp,
                fontFamily: "Baloo",
                fontWeight: FontWeight.w400,
                color: AppColors.amberColor,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
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
            padding: EdgeInsets.all(5.w),
            child: BlocConsumer<ProfileCubit, ProfileState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                if(courseCubit.enrolledCourses != null) {
                  if(courseCubit.enrolledCourses!.data!.isNotEmpty){
                     return ListView.separated(
                  itemCount: courseCubit.enrolledCourses!.data!.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10.h,
                    );
                  },
                  itemBuilder: (context, index) {
                    return ViewCourseWidget(course: courseCubit.enrolledCourses!.data![index]);
                  },
                );
                  }else{
                    return Center(
                      child: Text(
                        AppStrings.noCourses,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: "Baloo",
                          fontWeight: FontWeight.w400,
                          color: AppColors.amberColor,
                        ),
                      ),
                    );
                  }
                }else{
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
               
              },
            ),
          )))
        ],
      ),
    );
  }
}
