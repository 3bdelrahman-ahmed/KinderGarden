import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kg_sa/core/statics/app_colors.dart';
import 'package:kg_sa/features/home/presentaion/pages/home_screen.dart';
import 'package:kg_sa/features/inbox/presentaion/pages/inbox_screen.dart';
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
    InboxScreen()
  ];

  int myCurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:Colors.white,
      bottomNavigationBar: Container(
        height: 80.h,
        decoration: BoxDecoration(
 boxShadow: [
            BoxShadow(
              
              color: Colors.black.withOpacity(0.1), // Shadow color
              spreadRadius: 0, // Spread radius
              blurRadius: 5, // Blur radius
              offset: Offset(0, -5), // Shadow position, negative y value means above the container
            ),
          ],
        ),
      // margin: EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.w),
        child: ClipRRect(
           borderRadius: BorderRadius.circular(40.w),
          child: BottomNavigationBar(
            elevation: 0 ,
            unselectedLabelStyle: TextStyle(fontFamily: "Baloo",
            fontSize: 13.sp,
            fontWeight: FontWeight.w400
            ),
            backgroundColor: AppColors.bottomNavigationBarColor,
            selectedItemColor: AppColors.amberColor,
            unselectedItemColor: Colors.white,
            selectedLabelStyle: TextStyle(fontFamily: "Baloo",
            fontSize: 15.sp,
            fontWeight: FontWeight.w400
            ),
            currentIndex: myCurrentIndex,
            onTap: (index){
              setState(() {
                myCurrentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
              BottomNavigationBarItem(icon: Icon(Icons.inbox),label: "Inbox"),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: myCurrentIndex,
        children: pages),
    );
  }
}