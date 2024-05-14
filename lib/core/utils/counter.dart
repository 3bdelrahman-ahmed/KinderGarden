import 'package:kg_sa/features/profile/data/models/courses_model.dart';

int countFalseSelections(CoursesModel coursesData) {
  int count = 0;
  for (Course course in coursesData.data! ) {
  if (course.isSelected!) {
      count++;
    }
  }
  return count;
}