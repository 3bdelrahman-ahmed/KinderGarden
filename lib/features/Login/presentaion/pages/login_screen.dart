import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kg_sa/core/statics/app_colors.dart';
import 'package:kg_sa/core/statics/app_strings.dart';
import 'package:kg_sa/core/utils/navigation_utils.dart';
import 'package:kg_sa/core/widgets/bottom_nav_bar.dart';
import 'package:kg_sa/core/widgets/flutter_toast.dart';
import 'package:kg_sa/core/widgets/start_design_widget.dart';

import 'package:kg_sa/features/home/presentaion/pages/home_screen.dart';
import 'package:kg_sa/features/registeration/presentaion/pages/registraion_screem.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/widgets/default_button.dart';
import '../../../../core/widgets/text_form_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const StartDesignWidget(),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  AppStrings.signIn,
                  style: TextStyle(
                      color: AppColors.amberColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 30.sp,
                      fontFamily: "Baloo"),
                ),
                TextFieldWidget(
                  hintText: "Enter Your Email",
                  textEditingController: emailAddressController,
                  obsucreText: false,
                ),
                SizedBox(
                  height: 15.h,
                ),
                TextFieldWidget(
                  hintText: "Enter Your Password",
                  textEditingController: passwordController,
                  obsucreText: true,
                
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      flex: 0,
                      child: Text(
                        AppStrings.forgotPassword,
                        style: TextStyle(
                          fontFamily: "BalooBahi2",
                          fontSize: 14.sp,
                          color: AppColors.amberColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 0,
                      child: TextButton(
                        onPressed: () {
                          // Handle button press
                        },
                        child: Text(
                          AppStrings.resetPassword,
                          style: TextStyle(
                            fontFamily: "BalooBahi2",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.amberColor,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.amberColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
          
                SizedBox(height: 10.h,),
                Center(
                  child: GestureDetector(
                    onTap: (){
                        if(emailAddressController.text.isEmpty || passwordController.text.isEmpty){
                          showToast(
                            context,
                            "Please Make Sure to Fill All Fields",
                            AppColors.buttonsColor,
                          );
                        }
                        else{
                          FlutterUtils.pushReplacement(context, BottomNavigationBarWidget());
                        }
                    },
                    child: Container(
                      height: 50.h,
                      width: 115.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(25.w),right: Radius.circular(25.w)),
                        color: AppColors.buttonsColor
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(AppStrings.signIn,
                            style: TextStyle(
                              fontFamily: "Baloo",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white
                            ),
                          ),
                          Icon(Icons.login,
                          color: Colors.white,
                          size: 20.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5.h,),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(AppStrings.donotHaveAccount,
                      style: TextStyle(
                        fontFamily: "BalooBahi2",
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.amberColor,
                      ),
                      ),

                      TextButton(onPressed: (){
                          FlutterUtils.push(context, RegisterationScreen());
                      }, child: Text(AppStrings.register,
                       style: TextStyle(
                        fontFamily: "BalooBahi2",
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.amberColor,
                         decoration: TextDecoration.underline,
                        decorationColor: AppColors.amberColor,
                      ),
                      ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
