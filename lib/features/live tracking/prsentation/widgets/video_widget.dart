import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kg_sa/core/widgets/custom_image_view.dart';

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
  child: Stack(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(25.w),
          right: Radius.circular(25.w)),
        child: Image.network(
          "https://www.canr.msu.edu/contentAsset/image/613ecf12-91f1-4292-8ec2-d1feb5547a9d/fileAsset/filter/Resize,Jpeg/resize_w/750/jpeg_q/80",
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
      Align(
        alignment: Alignment.center,
        child: CustomImageView(
          imagePath: "assets/images/play.png",
          width: 50.w,
          height: 50.h,
        )
      ),
    ],
  ),
)
,
          SizedBox(
            height: 24.h,
          ),
          TitleWidget(text: "Snippets", image: "assets/svgs/snpites.svg"),
          SizedBox(
            height: 8.h,
          ),
          Column(
            children: List.generate(
              2,
              (index) => Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 7.h), // Adjust the vertical spacing as needed
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
