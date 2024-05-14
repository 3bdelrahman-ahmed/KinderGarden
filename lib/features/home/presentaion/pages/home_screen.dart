import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kg_sa/core/statics/app_cashing.dart';
import 'package:kg_sa/core/statics/app_colors.dart';
import 'package:kg_sa/core/statics/app_strings.dart';
import 'package:kg_sa/core/widgets/flutter_toast.dart';
import 'package:kg_sa/features/Login/domain/cubit/login_cubit.dart';
import 'package:kg_sa/features/home/domain/cubit/teacher_cubit.dart';
import 'package:kg_sa/features/home/presentaion/widgets/live_tracking_widget.dart';
import 'package:kg_sa/features/home/presentaion/widgets/teachers_list_widget.dart';

import '../../../../core/widgets/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override 
  void initState() {
    super.initState();
    BlocProvider.of<TeacherCubit>(context).getTeachersList(
      context,
     AppColors.error,
     AppCashingService.token
    );
  }
  @override
  Widget build(BuildContext context) {
    var teacherCubit = context.read<TeacherCubit>();
    return Scaffold(
     // bottomNavigationBar: BottomNavigationBarWidget(),
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
                  fontSize: 32.sp,
                  fontFamily: "Baloo",
                  fontWeight: FontWeight.w400,
                  color: AppColors.amberColor),
            ),
          ),
          Center(child: liveTrackingWidget()),
          Padding(
            padding: EdgeInsets.only(top: 22.h, left: 10.w),
            child: Text(
              AppStrings.teachersList,
              style: TextStyle(
                  fontSize: 32.sp,
                  fontFamily: "Baloo",
                  fontWeight: FontWeight.w400,
                  color: AppColors.amberColor),
            ),
          ),
          BlocConsumer<TeacherCubit, TeacherState>(
            listener: (context, state) {
              if(state is TeacherListLoadedState){
               showToast(context, AppStrings.teachersListsuccess, AppColors.amberColor);
              }
            },
            builder: (context, state) {
                if(teacherCubit.teachersList !=null){
                  if(teacherCubit.teachersList!.data!.isNotEmpty){
                    return Expanded(child: TeachersListWiget(
                      teachersModel: teacherCubit.teachersList!,
                    ));
                  }
                  else{
                    return Expanded(child: Center(child: Text(AppStrings.teachersListEmpty,
                    style: TextStyle(
                      fontFamily: "Baloo",
                      fontSize: 20.sp,
                      color: AppColors.amberColor,
                      fontWeight: FontWeight.w400
                    ),
                    )));
                  }
                }else{
                  return Expanded(child: Center(child: CircularProgressIndicator()));
                }
              
            },
          ),
        ],
      ),
    );
  }
}
