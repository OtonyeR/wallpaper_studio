import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_studio/presentation/themes/app_theme.dart';

class GradientGlassChip extends StatelessWidget {
  final double? width;
  final double? height;
  final String label;
  final Widget? child;

  const GradientGlassChip({
    super.key,
    required this.label,
    this.width,
    this.height,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: width ?? null,
      width: width ?? null,
      padding: const EdgeInsets.all(1.5),
      // gradient border thickness
      decoration: BoxDecoration(
        gradient: AppTheme.glassGradient,
        borderRadius: BorderRadius.circular(30),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12), // glass blur
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: const Color.fromARGB(55, 255, 255, 255),
              // translucent white
              borderRadius: BorderRadius.circular(30.r),
            ),
            child:
                child ??
                Text(label, style: Theme.of(context).textTheme.bodySmall),
          ),
        ),
      ),
    );
  }
}

class InfoChip extends StatelessWidget {
  final String label;

  const InfoChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color.fromRGBO(135, 135, 135, 0.1),
        border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.05), width: 1.w),
      ),
      child: Text(
        label,
        style: Theme.of(
          context,
        ).textTheme.bodySmall!.copyWith(color: Colors.black),
      ),
    );
  }
}
