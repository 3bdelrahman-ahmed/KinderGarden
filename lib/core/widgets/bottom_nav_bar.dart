import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kg_sa/core/statics/app_cashing.dart';
import 'package:kg_sa/core/statics/app_colors.dart';
import 'package:kg_sa/features/courses/presentaion/pages/courses_screen.dart';
import 'package:kg_sa/features/home/domain/cubit/teacher_cubit.dart';
import 'package:kg_sa/features/home/presentaion/pages/home_screen.dart';
import 'package:kg_sa/features/inbox/presentaion/pages/inbox_screen.dart';
import 'package:kg_sa/features/profile/domain/cubit/profile_cubit.dart';
import 'package:kg_sa/features/profile/presentaion/pages/profile_screen.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  State<BottomNavigationBarWidget> createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  List <Widget> pages =[
    HomeScreen(),
    ProfileScreen(),
     CoursesScreen(),
    InboxScreen(),
   
  ];

  int myCurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
       backgroundColor:AppColors.primaryColor,
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 85.h,
          decoration: BoxDecoration(
           borderRadius: BorderRadius.horizontal(left: Radius.circular(30.w),right: Radius.circular(30.w)),
         boxShadow: [
              BoxShadow(
                
                color: Colors.black.withOpacity(0.1), // Shadow color
                spreadRadius: 0, // Spread radius
                blurRadius: 5, // Blur radius
                offset: Offset(0, -5), // Shadow position, negative y value means above the container
              ),
            ],
          ),
          child: ClipRRect(
             borderRadius: BorderRadius.circular(40.w),
           
            child: BottomNavigationBar(
              
              elevation: 0 ,
              currentIndex: myCurrentIndex,
              onTap: (index){
                if(index == 0){
                  context.read<TeacherCubit>().getTeachersList(context, AppColors.error, AppCashingService.token);
                }
                else if(index == 1){
                  context.read<ProfileCubit>().gerUserProfileData(context, AppColors.error, AppCashingService.token);
                 context.read<ProfileCubit>().getAllCourses(context, AppColors.error, AppCashingService.token);
                  context.read<ProfileCubit>().getUserGrades(context, AppColors.error, AppCashingService.token);
        
                }
                else if(index == 3){
                  context.read<ProfileCubit>().getAllCourses(context, AppColors.error, AppCashingService.token);
                }
                setState(() {
                  myCurrentIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
                 BottomNavigationBarItem(icon: Icon(Icons.book),label: "course"),
                BottomNavigationBarItem(icon: Icon(Icons.inbox),label: "Inbox"),
                
        
              ],
            ),
          ),
        ),
      ),
      body: IndexedStack(
        index: myCurrentIndex,
        children: pages),
    );
  }
}