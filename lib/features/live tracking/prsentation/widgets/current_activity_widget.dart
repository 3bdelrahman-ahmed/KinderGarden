import 'package:flutter/material.dart';
import 'package:kg_sa/features/live%20tracking/prsentation/widgets/activity_info_widget.dart';

import '../../../../core/widgets/title_widget.dart';

class CurrentActivityWidget extends StatelessWidget {
  const CurrentActivityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
         // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TitleWidget(text: "Current Activity", image: "assets/svgs/timer.svg"),
        Column(
          
          children: List.generate(5, (index) => ActivityInfoWidget()),
        )
      ],
    );
  }
}
