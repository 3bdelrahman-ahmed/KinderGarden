import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kg_sa/core/statics/app_colors.dart';
import 'package:kg_sa/core/statics/app_strings.dart';
import 'package:kg_sa/core/widgets/custom_image_view.dart';

import '../../../../core/widgets/start_design_widget.dart';
import '../../../Login/presentaion/pages/login_screen.dart';
import '../widgets/rainbow_text_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   @override
  void initState() {
    super.initState();
    // Start the timer when the widget is initialized
    Timer (const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return const  Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: StartDesignWidget()
    );
  }
}
