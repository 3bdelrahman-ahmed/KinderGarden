import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImage extends StatefulWidget {
  final double? size;
  final String? imageUrl;

  const ProfileImage(
      {super.key,  this.size, this.imageUrl});

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
 @override
Widget build(BuildContext context) {
  return Stack(
    alignment: Alignment.bottomRight,
    children: [
      CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: widget.size ?? 38,
        child: widget.imageUrl != null && widget.imageUrl!.isNotEmpty
            ? ClipOval(
                child: Image.network(
                  widget.imageUrl!,
                  fit: BoxFit.cover,
                  width: widget.size ?? 55.w,
                  height: widget.size ?? 55.h,
                ),
              )
            : Icon(
                Icons.account_circle,
                size: widget.size ?? 38,
                color: Colors.grey,
              ),
      ),
    ],
  );
}

}
