import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kg_sa/core/statics/app_colors.dart';
import 'package:kg_sa/core/utils/time_formatter.dart';
import 'package:kg_sa/core/widgets/profile_image.dart';
import 'package:kg_sa/features/live%20tracking/data/models/current_activity_mcodel.dart';
import 'package:kg_sa/features/profile/domain/cubit/profile_cubit.dart';

import '../../../../core/utils/string_formatter.dart';

class ActivityInfoWidget extends StatelessWidget {
  final Activity activity ;
  const ActivityInfoWidget({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileImage(
          imageUrl:
          context.read<ProfileCubit>().userData!.data!.profilePicture!
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              formatTimeString(activity.createdAt!),
              style: TextStyle(
                  fontSize: 10.sp,
                  color: AppColors.amberColor,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Cairo"),
            ),
            Text(
              formatString(
                  "${context.read<ProfileCubit>().userData!.data!.name } ${activity.title!}"),
              style: TextStyle(
                  color: AppColors.amberColor,
                  fontFamily: "Baloo",
                  fontSize: 14.w,
                  fontWeight: FontWeight.w400),
            ),
          ],
        )
      ],
    );
  }
}
