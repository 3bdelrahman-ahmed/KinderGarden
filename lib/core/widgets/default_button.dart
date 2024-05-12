
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kg_sa/core/widgets/flutter_toast.dart';

import '../statics/app_colors.dart';


class DefaultButton extends StatelessWidget {
  final String buttonText;

  final void Function()? function;
  final Color? colors;
  final Color? borderColor;

  final TextStyle? buttonTextStyle;

  const DefaultButton(
      {Key? key,
      required this.buttonText,
      required this.function,
      this.colors,
      this.borderColor,
      this.buttonTextStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: 300.w,
        height: 45.h,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          color: colors ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(7),
          border: borderColor != null
              ? Border.all(
                  color: borderColor!,
                )
              : null,
        ),
        child: Center(
            child: Text(
          buttonText,
          style:const TextStyle(
            fontFamily: "Cairo",
            fontSize: 18,
            color: Colors.white,
          ),
        )),
      ),
    );
      }
}
