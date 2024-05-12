import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import flutter_bloc package
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kg_sa/features/registeration/domain/cubit/register_cubit.dart';

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
              // BlocProvider(
              //   create: (context) => SubjectBloc(),
              // ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: SplashScreen(),
            ),
          );
        });
  }
}