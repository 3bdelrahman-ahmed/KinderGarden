import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import flutter_bloc package
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kg_sa/features/Login/domain/cubit/login_cubit.dart';
import 'package:kg_sa/features/home/domain/cubit/teacher_cubit.dart';
import 'package:kg_sa/features/registeration/domain/cubit/register_cubit.dart';

import 'features/profile/domain/cubit/profile_cubit.dart';
import 'features/splash/presentaion/pages/splash_screen.dart';

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => RegisterCubit(),
              ),
              BlocProvider(
                create: (context) => LoginCubit(),
              ),
               BlocProvider(
                create: (context) => TeacherCubit(),
              ),
               BlocProvider(
                create: (context) => ProfileCubit(),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: SplashScreen(),
            ),
          );
        });
  }
}