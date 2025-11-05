import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/app_theme.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final double? width;
  final Color textColor;
  final VoidCallback? onTap;
  final bool hasIcon;
  final bool isOutlined;
  final Widget? icon;

  const CustomButton({
    super.key,
    required this.buttonText,
    this.onTap,
    required this.textColor,
    required this.hasIcon,
    this.icon,
    required this.isOutlined,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Expanded(
        child: Container(
          width: width ?? null,
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 41.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21.r),
            color: isOutlined ? AppTheme.background : AppTheme.selectedColor,
            border: isOutlined
                ? Border.all(
                    width: 1.w,
                    color: const Color.fromARGB(255, 223, 223, 223),
                  )
                : null,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: hasIcon,
                  child: Row(
                    children: [
                      icon ?? Container(),
                      SizedBox(width: 10.w),
                    ],
                  ),
                ),
                Text(
                  buttonText,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: isOutlined ? Colors.black : Colors.white,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
