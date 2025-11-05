import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/wallpaper.dart';
import '../themes/app_theme.dart';
import 'gradient_text.dart';
import 'icon_button.dart';

class CurrentWallpaperBox extends StatelessWidget {
  const CurrentWallpaperBox({
    super.key,
    required this.wallpaper,
    required this.isNarrowScreen,
    required this.height,
    required this.isMediumScreen,
    required this.width,
  });

  final bool isNarrowScreen;
  final double height;
  final bool isMediumScreen;
  final double width;
  final Wallpaper wallpaper;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.33.h,
      padding: EdgeInsets.only(
        left: 20.w,
        bottom: 20.h,
        top: 20.h,
        right: 40.w,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(43.r),
        border: Border.all(color: AppTheme.borderColorPrimary, width: 1.w),
      ),
      child: Row(
        crossAxisAlignment: isNarrowScreen
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          Container(
            height: height,
            width: 118.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26.r),
              border: Border.all(
                width: 3.w,
                color: Color.fromARGB(255, 227, 227, 227),
              ),
              image: DecorationImage(
                image: AssetImage(wallpaper.assetPath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 20.w),
          Expanded(
            child: SizedBox(
              // width: isMediumScreen ? width * 0.5 : width * 0.7,
              child: Column(
                mainAxisAlignment: isNarrowScreen
                    ? MainAxisAlignment.spaceAround
                    : MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GradientText(
                    'Your Active Wallpaper',
                    gradient: AppTheme.headingGradient,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: isMediumScreen ? 16.sp : 36.sp,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  SizedBox(
                    width: isNarrowScreen
                        ? 205.w
                        : isMediumScreen
                        ? 300
                        : width * 0.8,
                    child: Text(
                      'This wallpaper is currently set as your active background',
                      overflow: TextOverflow.visible,
                      softWrap: true,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: isMediumScreen ? 12.sp : 20.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(
                                fontSize: isMediumScreen ? 12.sp : 16.sp,
                              ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Category - ',
                            ),
                            TextSpan(
                              text: wallpaper.category.title,
                              style: Theme.of(context).textTheme.headlineMedium!
                                  .copyWith(
                                    fontSize: isMediumScreen ? 12.sp : 16.sp,
                                  ),
                            ),

                            // Line Break
                            const TextSpan(text: '\n'),

                            TextSpan(
                              text: 'Selection - ',
                            ),
                            TextSpan(
                              text: wallpaper.title,
                              style: Theme.of(context).textTheme.headlineMedium!
                                  .copyWith(
                                    fontSize: isNarrowScreen ? 12.sp : 16.sp,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: !isNarrowScreen,
                        child: Row(
                          spacing: 12.w,
                          children: [
                            CustomIconButton(iconName: 'upload'),
                            CustomIconButton(iconName: 'settings'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Visibility(
                    visible: isNarrowScreen,
                    child: Row(
                      spacing: 12.w,
                      children: [
                        CustomIconButton(iconName: 'upload'),
                        CustomIconButton(iconName: 'settings'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
