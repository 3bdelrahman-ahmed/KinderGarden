import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kg_sa/core/statics/app_colors.dart';
import 'package:kg_sa/core/statics/app_strings.dart';
import 'package:kg_sa/core/utils/navigation_utils.dart';
import 'package:kg_sa/core/widgets/start_design_widget.dart';
import 'package:kg_sa/core/widgets/text_form_field_widget.dart';
import 'package:kg_sa/features/Login/presentaion/pages/login_screen.dart';
import 'package:kg_sa/features/registeration/domain/cubit/register_cubit.dart';

import '../../../../core/widgets/flutter_toast.dart';

class RegisterationScreen extends StatefulWidget {
  const RegisterationScreen({super.key});

  @override
  State<RegisterationScreen> createState() => _RegisterationScreenState();
}
    XFile? img ;

class _RegisterationScreenState extends State<RegisterationScreen> {
  @override
  Widget build(BuildContext context) {
    var registerCubit = context.read<RegisterCubit>();
    TextEditingController _firstNameController = TextEditingController();
    TextEditingController _lastNameController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            StartDesignWidget(),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.firstName,
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontFamily: "Baloo",
                        fontWeight: FontWeight.w400,
                        color: AppColors.amberColor,
                      ),
                    ),
                    TextFieldWidget(
                      textEditingController: _firstNameController,
                      width: 163,
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.lastName,
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontFamily: "Baloo",
                        fontWeight: FontWeight.w400,
                        color: AppColors.amberColor,
                      ),
                    ),
                    TextFieldWidget(
                      textEditingController: _lastNameController,
                      width: 163,
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.coloreFulEmail,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontFamily: "Baloo",
                      fontWeight: FontWeight.w400,
                      color: AppColors.amberColor,
                    ),
                  ),
                  TextFieldWidget(
                    textEditingController: _emailController,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.coloreFulPassword,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontFamily: "Baloo",
                      fontWeight: FontWeight.w400,
                      color: AppColors.amberColor,
                    ),
                  ),
                  TextFieldWidget(
                    textEditingController: _passwordController,
                    obsucreText: true,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            BlocConsumer<RegisterCubit, RegisterState>(
              listener: (context, state) {
                print("current state:  + ${state}");
                if(state is RegisterSuccess){
                   showToast(
                        context,
                        "Sign In With Your New Account",
                        AppColors.buttonsColor,
                      );
                  FlutterUtils.pushReplacement(context, LoginScreen());
                }
                // else if(state is RegisterFailure){
                //     showToast(
                //         context,
                //         "Something went wrong try later",
                //         AppColors.buttonsColor,
                //       );
                // }
              },
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [

                    GestureDetector(
                      onTap: (){
                        _imagePick();

                      },
                      child: Icon(Icons.image,
                      size: 40.w,
                      color: AppColors.amberColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print(img!.path);
                        if (_firstNameController.text.isEmpty ||
                            _lastNameController.text.isEmpty ||
                            _emailController.text.isEmpty ||
                            _passwordController.text.isEmpty) {
                          showToast(
                            context,
                            "Please Make Sure to Fill All Fields",
                            AppColors.buttonsColor,
                          );
                        } else {
                              registerCubit.register(
                                RegisterParameters(_firstNameController.text+_lastNameController.text, _emailController.text, _passwordController.text, 
                                File(img!.path),
                                 DateTime.now()),
                                 context,
                                 Colors.red,
                              );
                        }
                      },
                      child: Container(
                        height: 50.h,
                        width: 115.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(25.w),
                                right: Radius.circular(25.w)),
                            color: AppColors.buttonsColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              AppStrings.signUp,
                              style: TextStyle(
                                  fontFamily: "Baloo",
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                            Icon(
                              Icons.login,
                              color: Colors.white,
                              size: 20.w,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
  Future _imagePick() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      img = image;
    });
  }
}

  
