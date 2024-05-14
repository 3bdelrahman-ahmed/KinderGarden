import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kg_sa/core/statics/app_colors.dart';
import 'package:kg_sa/core/widgets/profile_image.dart';
import 'package:kg_sa/features/profile/presentaion/widgets/erolled_courses_widget.dart';

import '../../../../core/statics/app_cashing.dart';
import '../../../../core/statics/app_strings.dart';
import '../../domain/cubit/profile_cubit.dart';
import '../widgets/grades_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<ProfileCubit>()
        .gerUserProfileData(context, AppColors.error, AppCashingService.token);
  }

  @override
  Widget build(BuildContext context) {
    var profileCubit = context.read<ProfileCubit>();
    return Scaffold(
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if(profileCubit.userData !=null){
 return Stack(
            //   fit: StackFit.expand,

            children: [
              Positioned(
                top: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200.h,
                  child: Image.asset(
                    'assets/images/aa.png', // Replace 'background_image.jpg' with your image asset
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.only(top: 65.h),
                    width: MediaQuery.of(context).size.width,
                    height: 470.h,
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.1), // Shadow color
                            offset: const Offset(0, -5),
                            blurRadius: 5,
                            spreadRadius: 0,
                          ),
                        ],
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(44.h))),
                    child: Column(
                      children: [
                        Text(
                          profileCubit.userData!.data!.name!,
                          style: TextStyle(
                              fontFamily: "Baloo",
                              fontSize: 25.sp,
                              color: AppColors.splashTextColor,
                              fontWeight: FontWeight.w400),
                        ),
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.all(20.w),
                              width: 320.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(44.h)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey
                                        .withOpacity(0.2), // Shadow color
                                    spreadRadius: 5, // How spread the shadow is
                                    blurRadius: 7, // How blurred the shadow is
                                    offset: Offset(
                                        0, 2), // Changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  EnrolledCouresWidget(),
                                  GradesWidget()
                                ],
                              )),
                        )
                      ],
                    ),
                  )),
              Positioned(
                  top: 100.h,
                  left: 125.w,
                  right: 125.w,
                  //  right: ScreenUtil.defaultSize.width/2.w,
                  child: Container(
                    padding: EdgeInsets.all(3.w),
                    width: 100.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(100.w)),
                    ),
                    alignment: Alignment.center,
                    child: ProfileImage(
                      imageUrl: profileCubit.userData!.data!.profilePicture,
                      size: 90.w,
                    ),
                  ))
            ],
          );
          }
          else{
            return Center(child: CircularProgressIndicator(),);
          }
         
        },
      ),
    );
  }
}
