
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordButton extends StatelessWidget {
  const PasswordButton({
    super.key,
    required this.title,
    required this.onTab,
    this.iconData,
  });

  final String title;
  final VoidCallback onTab;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: 33,
          vertical: 22,
        ),
        backgroundColor: Colors.white10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(200.r),
        ),
      ),
      onPressed: onTab,
      child: iconData == null
          ? Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
              ),
            )
          : Icon(
              iconData!,
              color: Colors.white,
            ),
    );
  }
}
