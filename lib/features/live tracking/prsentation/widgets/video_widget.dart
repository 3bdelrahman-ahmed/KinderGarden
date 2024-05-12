import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/title_widget.dart';
import 'image_sinnpites_card.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
                      children: [
                        TitleWidget(text: "Video", image: "assets/svgs/PC.svg"),
                        SizedBox(
                          height: 8.h,
                        ),
                        Container(
                          width: 330.w,
                          height: 245.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(25.w),
                                right: Radius.circular(25.w)),
                            color: Colors.amber,
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        TitleWidget(
                            text: "Snippets", image: "assets/svgs/snpites.svg"),
                        SizedBox(
                          height: 8.h,
                        ),
                        Column(
                          children: List.generate(
                            2,
                            (index) => Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 7
                                      .h), // Adjust the vertical spacing as needed
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: List.generate(
                                  2,
                                  (index) => ImageSnipptesCard(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
    );
  }
}