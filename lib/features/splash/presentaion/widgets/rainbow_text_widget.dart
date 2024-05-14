import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextSpan getRainbowText() {
  return  TextSpan(
      text: '',
      style:  TextStyle(
        fontFamily: "Baloo", // Set your desired font family
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
      ),
      children: [
        _coloredLetter('R', const Color.fromARGB(255, 143, 71, 66)),
        _coloredLetter('a', const Color.fromARGB(255, 170, 136, 84)),
        _coloredLetter('i', const Color.fromARGB(255, 176, 168, 100)),
        _coloredLetter('n', const Color.fromARGB(255, 95, 172, 97)),
        _coloredLetter('b', const Color.fromARGB(255, 85, 127, 162)),
        _coloredLetter('o', const Color.fromARGB(255, 90, 104, 183)),
        _coloredLetter('w', const Color.fromARGB(255, 145, 87, 156)),
      ],
    );
  
}

TextSpan _coloredLetter(String letter, Color color) {
  return TextSpan(
    text: letter,
    style: TextStyle(color: color),
  );
}
