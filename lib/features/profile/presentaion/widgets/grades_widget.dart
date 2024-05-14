import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kg_sa/core/statics/app_cashing.dart';
import 'package:kg_sa/core/statics/app_colors.dart';
import 'package:kg_sa/core/widgets/custom_category_container.dart';
import 'package:kg_sa/features/profile/domain/cubit/profile_cubit.dart';

import '../../../../core/statics/app_strings.dart';

class GradesWidget extends StatefulWidget {
  const GradesWidget({super.key});

  @override
  State<GradesWidget> createState() => _GradesWidgetState();
}

class _GradesWidgetState extends State<GradesWidget> {
  @override
  void initState() {
    super.initState();
    context
        .read<ProfileCubit>()
        .getUserGrades(context, AppColors.error, AppCashingService.token);
  }

  @override
  Widget build(BuildContext context) {
    var profileCubit = context.read<ProfileCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.grdes,
          style: TextStyle(
            fontSize: 28.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.amberColor,
            fontFamily: "Baloo",
          ),
        ),
        Container(
            width: 300.w,
            height: 140.h,
            child: BlocConsumer<ProfileCubit,ProfileState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                if(profileCubit.grades != null){
                  if(profileCubit.grades!.data!.isNotEmpty){
                 return ListView.separated(
                  itemCount: profileCubit.grades!.data!.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: ((context, index) {
                    print(profileCubit.grades!.data![index].grade ?? "");
                    return CustomCategoryCotainerWidget(
                      padding: 10.w,
                      width: 290.w,
                      height: 35.h,
                      radius: 10.w,
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            profileCubit.grades!.data![index].courseName ?? " ",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.categoryTextColor,
                              fontFamily: "Baloo",
                            ),
                          ),
                          Text(
                            profileCubit.grades!.data![index].grade ?? " ",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.categoryTextColor,
                              fontFamily: "Baloo",
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 5.h,
                    );
                  },
                );
                  }else{
                    return Center(
                      child: Text(
                        AppStrings.noGrades,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.amberColor,
                          fontFamily: "Baloo",
                        ),
                      ),
                    );
                  }
                }else{
                  return Center(
                    child: CircularProgressIndicator(
                      strokeWidth:  2.4.w,
                    ),
                  );
                }
               
              },
            )),
      ],
    );
  }
}
