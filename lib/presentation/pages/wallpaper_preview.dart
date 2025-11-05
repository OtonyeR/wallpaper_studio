import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpaper_studio/presentation/pages/set_wallpaper.dart';

import '../../core/wallpaper_prefs.dart';
import '../../data/models/wallpaper.dart';
import '../themes/app_theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/gradient_chip.dart';
import '../widgets/gradient_text.dart';
import '../widgets/icon_button.dart';

class WallpaperPreview extends StatefulWidget {
  const WallpaperPreview({
    required this.isMediumScreen,
    required this.width,
    required Wallpaper selectedWallpaper,
  }) : _selectedWallpaper = selectedWallpaper;

  final bool isMediumScreen;
  final double width;
  final Wallpaper _selectedWallpaper;

  @override
  State<WallpaperPreview> createState() => _WallpaperPreviewState();
}

class _WallpaperPreviewState extends State<WallpaperPreview> {
  @override
  Widget build(BuildContext context) {
    void applyWallpaper(String wallpaperId) async {
      await WallpaperPrefs.setCurrentWallpaper(wallpaperId);

    }

    Future<void> _handleToggleSave(Wallpaper wallpaper) async {
      final success = await WallpaperPrefs.toggleSavedWallpaper(wallpaper.id);
      final walls = await WallpaperPrefs.getSavedWallpapers();


      if (success) {
        setState(() {
          if (walls.contains(wallpaper.id)) {
            walls.remove(wallpaper.id);
          } else {
            walls.add(wallpaper.id);
          }
        });
      }
    }


    return Container(
      width: widget.width * 0.50,
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        top: 115.h,
        left: 20.w,
        right: 20.w,
        bottom: 30.h,
      ),
      padding: !widget.isMediumScreen ? EdgeInsets.all(40.w) : null,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, asyncSnapshot) {
                if (widget.isMediumScreen) {
                  return Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 40.h),
                          Expanded(
                            child: DeviceFrame(
                              device: Devices.ios.iPhone15ProMax,
                              isFrameVisible: true,
                              orientation: Orientation.portrait,
                              screen: Image.asset(
                                widget._selectedWallpaper.assetPath,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          SizedBox(height: 24.h),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40.w),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Preview',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.headlineLarge,
                                    ),
                                    SizedBox(height: 37.h),
                                    Text(
                                      'Name',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(fontSize: 14.sp),
                                    ),
                                    Text(
                                      widget._selectedWallpaper.title,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.headlineMedium,
                                    ),
                                    SizedBox(height: 30.h),
                                    Text(
                                      'Tag',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(fontSize: 14.sp),
                                    ),
                                    SizedBox(height: 4.h),
                                    Wrap(
                                      spacing: 12.w,
                                      runSpacing: 12.h,
                                      children: List.generate(
                                        widget._selectedWallpaper.tags!.length,
                                        (index) {
                                          final String tag =
                                              widget._selectedWallpaper.tags![index];
                                          return InfoChip(label: tag);
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 30.h),
                                    Text(
                                      'Description',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(fontSize: 14.sp),
                                    ),
                                    GradientText(
                                      widget._selectedWallpaper.description!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(fontSize: 14.sp),
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: const [
                                          Color(0xFF000000),
                                          Color(0xFFFFFFFF),
                                        ],
                                        stops: const [0.0, 1.0],
                                      ),
                                    ),
                                    SizedBox(height: 37.h),
                                    Row(
                                      spacing: 12.w,
                                      children: [
                                        CustomIconButton(iconName: 'upload'),
                                        CustomIconButton(iconName: 'shrink'),
                                        CustomIconButton(iconName: 'settings'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(24.w),
                            child: Column(
                              children: [
                                CustomButton(
                                  buttonText: 'Save to Favourites',
                                  textColor: Colors.black,
                                  hasIcon: true,
                                  isOutlined: true,
                                  icon: SvgPicture.asset(
                                    'assets/icons/save.svg',
                                    color: Colors.black,
                                  ),
                                  onTap: () {
                                      _handleToggleSave(widget._selectedWallpaper);
                                  },
                                ),
                                SizedBox(height: 20.h),
                                CustomButton(
                                  buttonText: 'Set to Wallpaper',
                                  textColor: Colors.black,
                                  hasIcon: false,
                                  isOutlined: false,
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      builder: (BuildContext sheetContext) {
                                        return Dialog(
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          child: SetWallpaper(
                                            width: widget.width,
                                            isMediumScreen: widget.isMediumScreen,
                                            onSet: () {
                                              applyWallpaper(
                                                widget._selectedWallpaper.id,
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        right: 10.w,
                        top: 10.h,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: CircleAvatar(
                            radius: 22,
                            backgroundColor: AppTheme.selectedColor.withAlpha(
                              26,
                            ),
                            child: Icon(
                              Icons.cancel_outlined,
                              color: AppTheme.selectedColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Preview',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            SizedBox(height: 37.h),
                            Text(
                              'Name',
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium!.copyWith(fontSize: 14.sp),
                            ),
                            Text(
                              widget._selectedWallpaper.title,

                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 30.h),
                                    Text(
                                      'Tags',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(fontSize: 14.sp),
                                    ),
                                    SizedBox(height: 4.h),
                                    Wrap(
                                      spacing: 12.w,
                                      runSpacing: 12.h,
                                      children: List.generate(
                                        widget._selectedWallpaper.tags!.length,
                                        (index) {
                                          final String tag =
                                              widget._selectedWallpaper.tags![index];
                                          return InfoChip(label: tag);
                                        },
                                      ),
                                    ),

                                    SizedBox(height: 30.h),
                                    Text(
                                      'Description',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(fontSize: 14.sp),
                                    ),
                                    GradientText(
                                      widget._selectedWallpaper.description!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(fontSize: 14.sp),
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: const [
                                          Color(0xFF000000),
                                          Color(0xFFFFFFFF),
                                        ],
                                        stops: const [0.0, 1.0],
                                      ),
                                    ),

                                    SizedBox(height: 37.h),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              spacing: 12.w,
                              children: [
                                CustomIconButton(iconName: 'upload'),
                                CustomIconButton(iconName: 'shrink'),
                                CustomIconButton(iconName: 'settings'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 41.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: DeviceFrame(
                                device: Devices.ios.iPhone15ProMax,
                                isFrameVisible: true,
                                orientation: Orientation.portrait,
                                screen: widget._selectedWallpaper.assetPath.isEmpty
                                    ? Container(
                                        color: Colors.white,
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: EdgeInsets.all(16.w),
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            'Make a Selection to see Preview',
                                          ),
                                        ),
                                      )
                                    : Image.asset(
                                        widget._selectedWallpaper.assetPath,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                            SizedBox(height: 91.01.h),
                          ],
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
          !widget.isMediumScreen
              ? Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    children: [
                      Spacer(),
                      CustomButton(
                        buttonText: 'Save to Favourites',
                        textColor: Colors.black,
                        hasIcon: true,
                        isOutlined: true,
                        icon: SvgPicture.asset(
                          'assets/icons/save.svg',
                          color: Colors.black,
                        ),
                        onTap: () {
                            _handleToggleSave(widget._selectedWallpaper);
                          },
                      ),
                      SizedBox(width: 20.w),
                      CustomButton(
                        onTap: () {
                          showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (BuildContext sheetContext) {
                              return Dialog(
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                child: SetWallpaper(
                                  width: widget.width,
                                  isMediumScreen: widget.isMediumScreen,
                                  onSet: () {
                                    applyWallpaper(widget._selectedWallpaper.id);
                                  },
                                ),
                              );
                            },
                          );
                        },
                        buttonText: 'Set to Wallpaper',
                        textColor: Colors.black,
                        hasIcon: false,
                        isOutlined: false,
                      ),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
