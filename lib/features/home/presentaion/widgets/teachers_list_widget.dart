import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kg_sa/features/home/data/models/teacher_model.dart';
import 'package:kg_sa/features/home/presentaion/widgets/teacher_widget.dart';

class TeachersListWiget extends StatelessWidget {
  final TeachersModel teachersModel;
  const TeachersListWiget({super.key, required this.teachersModel});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 345.w,
        padding: EdgeInsets.all(15.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(45.w)),
            boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // Shadow color
                    offset: const Offset(0,
                        -5),
                    blurRadius: 5, 
                    spreadRadius:
                        0, 
                  ),
            ],
            color: Colors.white,
        ),
        alignment: Alignment.center,
        child: ListView.separated(
          padding: EdgeInsets.zero,
          itemBuilder: (context,index){
            return TeacherWidget(
                teacherInfo: teachersModel.data![index],
            );
        }, separatorBuilder: ((context, index) {
          return SizedBox(height: 10.h,);
        }), itemCount: teachersModel.data!.length),
      ),
    );
  }
}