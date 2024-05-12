import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kg_sa/core/statics/app_colors.dart';
import 'package:kg_sa/core/statics/app_strings.dart';
import 'package:kg_sa/features/profile/presentaion/widgets/course_widget.dart';

import '../../../../core/widgets/custom_category_container.dart';

class EnrolledCouresWidget extends StatefulWidget {
  const EnrolledCouresWidget({Key? key}) : super(key: key);

  @override
  _EnrolledCouresWidgetState createState() => _EnrolledCouresWidgetState();
}

class _EnrolledCouresWidgetState extends State<EnrolledCouresWidget> {
  late final ScrollController _controller;
  final double _itemWidth = 100.w;
  final double _separatorWidth = 10.w;
  final int _itemCount = 5;
  bool _atEnd = false;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    _controller.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent) {
      setState(() {
        _atEnd = true;
      });
    } else {
      setState(() {
        _atEnd = false;
      });
    }
  }

  void _scrollToStart() {
    _controller.animateTo(
      0,
      curve: Curves.easeOut,
      duration: Duration(milliseconds: 300),
    );
  }

  void _scrollNext() {
    if (_atEnd) {
      _scrollToStart();
    } else {
      _controller.animateTo(
        (_controller.offset + (_itemWidth + _separatorWidth)).w,
        curve: Curves.easeOut,
        duration: Duration(milliseconds: 300),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
            Text(
                                    AppStrings.enrolledCourses,
                                    style: TextStyle(
                                      fontSize: 28.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.amberColor,
                                      fontFamily: "Baloo",
                                    ),
                                  ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 220.w,
              height: 100.h,
              color: Colors.white,
              child: ListView.separated(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CustomCategoryCotainerWidget(
                    height: 60.h,
                    width: _itemWidth,
                    widget: CourseWidget(),
                    radius: 30.w,
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: _separatorWidth);
                },
                itemCount: _itemCount,
              ),
            ),
            Container(
              width: 45.w,
              height: 45.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.amber,
              ),
              alignment: Alignment.center,
              child: IconButton(
                onPressed: _scrollNext,
                icon: Icon(
                  Icons.navigate_next,
                  size: 30.w,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
