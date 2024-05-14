import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kg_sa/core/statics/app_cashing.dart';
import 'package:kg_sa/core/statics/app_colors.dart';
import 'package:kg_sa/core/statics/app_strings.dart';
import 'package:kg_sa/features/profile/domain/cubit/profile_cubit.dart';
import 'package:kg_sa/features/profile/presentaion/widgets/course_widget.dart';

import '../../../../core/utils/counter.dart';
import '../../../../core/widgets/custom_category_container.dart';

class EnrolledCouresWidget extends StatefulWidget {
  const EnrolledCouresWidget({Key? key}) : super(key: key);

  @override
  _EnrolledCouresWidgetState createState() => _EnrolledCouresWidgetState();
}

class _EnrolledCouresWidgetState extends State<EnrolledCouresWidget> {
  late final ScrollController _controller;
  final double _itemWidth = 100.w;
  final double _separatorWidth = 10.w;
  final int _itemCount = 5;
  bool _atEnd = false;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    context.read<ProfileCubit>().getAllCourses(context, AppColors.error, AppCashingService.token);
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    _controller.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent) {
      setState(() {
        _atEnd = true;
      });
    } else {
      setState(() {
        _atEnd = false;
      });
    }
  }

  void _scrollToStart() {
    _controller.animateTo(
      0,
      curve: Curves.easeOut,
      duration: Duration(milliseconds: 300),
    );
  }

  void _scrollNext() {
    if (_atEnd) {
      _scrollToStart();
    } else {
      _controller.animateTo(
        (_controller.offset + (_itemWidth + _separatorWidth)).w,
        curve: Curves.easeOut,
        duration: Duration(milliseconds: 300),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var profileCubit = context.read<ProfileCubit>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.enrolledCourses,
          style: TextStyle(
            fontSize: 28.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.amberColor,
            fontFamily: "Baloo",
          ),
        ),
        BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {

            print(state);
            if(profileCubit.enrolledCourses != null){
            if(profileCubit.enrolledCourses!.data!.isNotEmpty){
              
              if(countFalseSelections(profileCubit.enrolledCourses!) >0){
                print(countFalseSelections(profileCubit.enrolledCourses!));
                   return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 220.w,
                  height: 100.h,
                  color: Colors.white,
                  child: ListView.separated(
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return profileCubit.enrolledCourses!.data![index].isSelected!? CustomCategoryCotainerWidget(
                        height: 60.h,
                        width: _itemWidth,
                        widget: CourseWidget(
                          course: profileCubit.enrolledCourses!.data![index],
                        ),
                        radius: 30.w,
                      ):SizedBox();
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: _separatorWidth);
                    },
                    itemCount: profileCubit.enrolledCourses!.data!.length,
                  ),
                ),
                Container(
                  width: 45.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.amber,
                  ),
                  alignment: Alignment.center,
                  child: IconButton(
                    onPressed: _scrollNext,
                    icon: Icon(
                      Icons.navigate_next,
                      size: 30.w,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            );
              }else{
                return Center(
                  child: Text(
                    AppStrings.noEnrolledCourses,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.amberColor,
                      fontFamily: "Baloo",
                    ),
                  ),
                );
              }
                
              }else{
                return Center(
                  child: Text(
                    AppStrings.noEnrolledCourses,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.amberColor,
                      fontFamily: "Baloo",
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
      ],
    );
  }
}
