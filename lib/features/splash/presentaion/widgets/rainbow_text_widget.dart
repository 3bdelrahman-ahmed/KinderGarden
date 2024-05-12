import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextSpan getRainbowText() {
  return  TextSpan(
      text: '',
      style:  TextStyle(
        fontFamily: "Baloo", // Set your desired font family
        fontSize: 15.sp,
        fontWeight: FontWeight.normal,
      ),
      children: [
        _coloredLetter('R', Colors.red),
        _coloredLetter('a', Colors.orange),
        _coloredLetter('i', Colors.yellow),
        _coloredLetter('n', Colors.green),
        _coloredLetter('b', Colors.blue),
        _coloredLetter('o', Colors.indigo),
        _coloredLetter('w', Colors.purple),
      ],
    );
  
}

TextSpan _coloredLetter(String letter, Color color) {
  return TextSpan(
    text: letter,
    style: TextStyle(color: color),
  );
}
