import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../themes/app_theme.dart';


class BarIcon extends StatelessWidget {
  final String iconName;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  const BarIcon({super.key, required this.iconName, required this.label, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // width: 108.w,
        // height: 44.h,
        margin: EdgeInsets.only(right: 12.w),
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.buttonColor : Colors.transparent,
          border: isSelected
              ? Border.all(width: 1.w, color: AppTheme.borderColorPrimary)
              : null,
          borderRadius: BorderRadius.circular(12.r),

        ),
        child: Row(
          children: [
            SizedBox(
              // height: 24.h,
              // width: 24.w,
              child: SvgPicture.asset(
                'assets/icons/$iconName.svg',
                color: isSelected ? Colors.black : AppTheme.textButton,
              ),
            ),
            SizedBox(width: 10.w),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.black : AppTheme.textButton,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

}

