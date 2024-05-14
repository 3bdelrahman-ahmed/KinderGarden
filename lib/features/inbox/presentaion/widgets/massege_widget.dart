import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kg_sa/core/statics/app_cashing.dart';
import 'package:kg_sa/core/statics/app_colors.dart';
import 'package:kg_sa/core/widgets/profile_image.dart';
import 'package:kg_sa/features/home/data/models/teacher_model.dart';
import 'package:kg_sa/features/home/domain/cubit/teacher_cubit.dart';
import 'package:kg_sa/features/profile/domain/cubit/profile_cubit.dart';

class MessageWidget extends StatefulWidget {
  final String senderName;
  final String message;
  final bool isSender; // color blue
  const MessageWidget(
      {super.key,
      required this.senderName,
      required this.message,
      required this.isSender});

  @override
  State<MessageWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  @override
  void initState() {
    super.initState();
    context
        .read<TeacherCubit>()
        .getTeachersList(context, AppColors.error, AppCashingService.token);
  }

  @override
  Widget build(BuildContext context) {
    var teacherCubit = context.read<TeacherCubit>();
    var profileCubit = context.read<ProfileCubit>();
    return Container(
      padding: EdgeInsets.all(8.w),
      width: (MediaQuery.of(context).size.width - 25.w).w,
      height: 65.h,
      decoration: BoxDecoration(
        color: widget.isSender
            ? AppColors.sendMessageColor
            : AppColors.bottomNavigationBarColor,
        borderRadius: widget.isSender
            ? BorderRadius.horizontal(right: Radius.circular(33.w))
            : BorderRadius.horizontal(left: Radius.circular(33.w)),
      ),
      child: widget.isSender
          ? BlocConsumer<ProfileCubit, ProfileState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                if (profileCubit.userData != null) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            profileCubit.userData!.data!.name!,
                            style: TextStyle(
                              fontFamily: "Baloo",
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              color: widget.isSender
                                  ? AppColors.splashTextColor
                                  : AppColors.amberColor,
                            ),
                          ),
                          Text(
                            widget.message,
                            style: TextStyle(
                              fontFamily: "Baloo",
                              fontSize: 10.sp,
                              // fontWeight: FontWeight.w100,
                              color: widget.isSender
                                  ? AppColors.splashTextColor
                                  : AppColors.amberColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      ProfileImage(
                          imageUrl:
                              profileCubit.userData!.data!.profilePicture!),
                    ],
                    // sender
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            )
          : BlocConsumer<TeacherCubit, TeacherState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                if (teacherCubit.teachersList != null) {
                  if (teacherCubit.teachersList!.data!.isNotEmpty) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProfileImage(
                            imageUrl: teacherCubit
                                .teachersList!.data!.first.profilePicture),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              teacherCubit.teachersList!.data!.first.name!,
                              style: TextStyle(
                                fontFamily: "Baloo",
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: widget.isSender
                                    ? AppColors.splashTextColor
                                    : AppColors.amberColor,
                              ),
                            ),
                            Text(
                              widget.message,
                              style: TextStyle(
                                fontFamily: "Baloo",
                                fontSize: 10.sp,
                                // fontWeight: FontWeight.w100,
                                color: widget.isSender
                                    ? AppColors.splashTextColor
                                    : AppColors.amberColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
    );
  }
}
