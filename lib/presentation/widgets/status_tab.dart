import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/app_theme.dart';

class SuccessStatusTab extends StatelessWidget {
  final String msg;
  final Widget icon;

  const SuccessStatusTab({
    super.key,
    required this.width, required this.msg, required this.icon,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 23.w),
      decoration: BoxDecoration(
        color: AppTheme.successBg,
        borderRadius: BorderRadius.circular(40.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(width: 11.w),
          Text(
            textAlign: TextAlign.center,
            msg,
            style: Theme
                .of(context)
                .textTheme
                .labelMedium!
                .copyWith(
              color: AppTheme.successText,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
