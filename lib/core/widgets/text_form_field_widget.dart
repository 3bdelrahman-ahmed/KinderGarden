import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kg_sa/core/statics/app_colors.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatefulWidget {
 late  TextEditingController textEditingController =TextEditingController();
   String? hintText;
  bool? obsucreText;
  double? width;
  double? height;
  TextFieldWidget(
      {super.key,
      required this.textEditingController,
       this.hintText,
      this.obsucreText,
      this.height,
      this.width});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.w),
        width: (widget.width ?? 338).w,
        height: (widget.height ?? 60).h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(20.w), right: Radius.circular(20.w)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(
                  0, 7), // Changes the position of the shadow vertically
            ),
          ],
        ),
        alignment: Alignment.center,
        child: TextField(
          
          controller: widget.textEditingController,
          decoration: InputDecoration(
            
            border: InputBorder.none,

            hintStyle: TextStyle(
                fontFamily: "Baloo2",
                fontSize: 20.sp,
                color: AppColors.textFormField,
                fontWeight: FontWeight.w400),

            hintText: widget.hintText ?? "", // Add your hint text here
          ),
          obscureText: widget.obsucreText ?? false,
        ));
  }
}
