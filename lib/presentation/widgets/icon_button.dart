import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../themes/app_theme.dart';

class CustomIconButton extends StatelessWidget {
  final String iconName;
  final double? buttonHeight;
  final double? buttonWidth;
  final double? radius;
  final Color? iconColor;
  final Color? iconAccent;
  final VoidCallback? onTap;
  final EdgeInsets? iconPadding;

  const CustomIconButton({
    super.key,
    this.onTap,
    required this.iconName,
    this.buttonHeight,
    this.buttonWidth,
    this.radius,
    this.iconColor,
    this.iconAccent, this.iconPadding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:  iconPadding ?? EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11.r),
          color: iconAccent ?? AppTheme.buttonColor,
        ),
        child: Center(
          child: SvgPicture.asset(
            'assets/icons/$iconName.svg',
            color: iconColor ?? AppTheme.textButton,
            height: buttonHeight ?? 19.sp,
          ),
        ),
      ),
    );
  }
}
