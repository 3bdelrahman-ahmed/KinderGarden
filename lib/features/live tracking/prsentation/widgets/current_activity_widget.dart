import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kg_sa/core/statics/app_cashing.dart';
import 'package:kg_sa/core/statics/app_colors.dart';
import 'package:kg_sa/core/statics/app_strings.dart';
import 'package:kg_sa/features/live%20tracking/domain/cubit/live_tracking_cubit.dart';
import 'package:kg_sa/features/live%20tracking/prsentation/widgets/activity_info_widget.dart';

import '../../../../core/widgets/title_widget.dart';

class CurrentActivityWidget extends StatefulWidget {
  const CurrentActivityWidget({super.key});

  @override
  State<CurrentActivityWidget> createState() => _CurrentActivityWidgetState();
}

class _CurrentActivityWidgetState extends State<CurrentActivityWidget> {
  @override
  void initState() {
    super.initState();
    context
        .read<LiveTrackingCubit>()
        .getUserActivity(context, AppColors.error, AppCashingService.token);
  }

  @override
  Widget build(BuildContext context) {
    var trackingCubit = context.read<LiveTrackingCubit>();
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TitleWidget(text: "Current Activity", image: "assets/svgs/timer.svg"),
        BlocConsumer<LiveTrackingCubit, LiveTrackingState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (trackingCubit.getActivity != null) {
              if (trackingCubit.getActivity!.data!.isNotEmpty) {
                return Column(
                  children: List.generate(
                      trackingCubit.getActivity!.data!.length,
                      (index) => ActivityInfoWidget(
                            activity: trackingCubit.getActivity!.data![index],
                          )),
                );
              } else {
                return Center(
                  child: Text(
                    AppStrings.noActivity,
                    style: TextStyle(
                        fontFamily: "Baloo",
                        color: AppColors.amberColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400),
                  ),
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )
      ],
    );
  }
}
