import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/app_theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/settings_option.dart';
import '../widgets/status_tab.dart';
import 'cat_details.dart';
import 'main_home.dart';

class SetWallpaper extends StatefulWidget {
  final bool isMediumScreen;
  final double width;
  final void Function() onSet;

  const SetWallpaper({
    super.key,
    required this.isMediumScreen,
    required this.width,
    required this.onSet,
  });

  @override
  State<SetWallpaper> createState() => _SetWallpaperState();
}

class _SetWallpaperState extends State<SetWallpaper> {
  DisplayMode _selectedMode = DisplayMode.fit;
  bool _isLockWallpaperEnabled = true;
  bool _isSyncEnabled = false;
  bool autoRotation = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.isMediumScreen
          ? EdgeInsets.only(left: 20.w, right: 20.w, top: widget.width * 0.21)
          : EdgeInsets.only(left: widget.width * 0.5),
      padding: EdgeInsets.symmetric(horizontal: 43.5.w, vertical: 43.5.h),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: widget.isMediumScreen
            ? BorderRadius.only(
                topRight: Radius.circular(16.r),
                topLeft: Radius.circular(16.r),
              )
            : BorderRadius.zero,
        boxShadow: widget.isMediumScreen
            ? [
                BoxShadow(
                  offset: Offset(0, -34),
                  color: Colors.grey.withAlpha(180),
                  spreadRadius: -20.r,
                ),
              ]
            : [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Wallpaper Setup',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: 8.h),
          Text(
            'Configure your wallpaper settings and enable auto-rotation',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 14.sp,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 26.h),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.isMediumScreen
                      ? SettingsOptionBox(
                          hasButton: true,
                          title: 'Activate Wallpaper',
                          subtitle:
                              'Set the selected wallpaper as your desktop background',
                          stackedWidget: SuccessStatusTab(
                            width: widget.width,
                            msg: 'Activated',
                            icon: Icon(
                              Icons.check_circle,
                              color: AppTheme.successText,
                              size: 18.sp,
                            ),
                          ),
                          child: Container(),
                        )
                      : SettingsOptionBox(
                          hasButton: true,
                          title: 'Activate Wallpaper',
                          subtitle:
                              'Set the selected wallpaper as your desktop background',
                          child: Row(
                            children: [
                              SuccessStatusTab(
                                width: widget.width,
                                msg: 'Activated',
                                icon: Icon(
                                  Icons.check_circle,
                                  color: AppTheme.successText,
                                  size: 18.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                  SizedBox(height: 26.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Display mode',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 20.sp,
                          color: Colors.black,
                        ),
                      ),

                      SizedBox(height: 8.h),
                      SettingOption<DisplayMode>(
                        title: 'Fit',
                        subtitle: 'Scale to fit without cropping',
                        value: DisplayMode.fit,
                        groupValue: _selectedMode,
                        onChanged: (DisplayMode? newValue) {
                          setState(() {
                            _selectedMode = newValue!;
                          });
                        },
                        activeColor: AppTheme.selectedColor,
                        isRadio: true,
                      ),
                      SizedBox(height: 8.h),

                      SettingOption<DisplayMode>(
                        title: 'Fill',
                        subtitle: 'Scale to fill the entire screen',
                        value: DisplayMode.fill,
                        groupValue: _selectedMode,
                        onChanged: (DisplayMode? newValue) {
                          setState(() {
                            _selectedMode = newValue!;
                          });
                        },
                        activeColor: AppTheme.selectedColor,
                        isRadio: true,
                      ),
                      SizedBox(height: 8.h),

                      SettingOption<DisplayMode>(
                        title: 'Stretch',
                        subtitle: 'Stretch to fill the screen',
                        value: DisplayMode.stretch,
                        groupValue: _selectedMode,
                        onChanged: (DisplayMode? newValue) {
                          setState(() {
                            _selectedMode = newValue!;
                          });
                        },
                        activeColor: AppTheme.selectedColor,
                        isRadio: true,
                      ),
                      SizedBox(height: 8.h),

                      SettingOption<DisplayMode>(
                        title: 'Tile',
                        subtitle: 'Repeat the image to fill the screen',
                        value: DisplayMode.tile,
                        groupValue: _selectedMode,
                        onChanged: (DisplayMode? newValue) {
                          setState(() {
                            _selectedMode = newValue!;
                          });
                        },
                        activeColor: AppTheme.selectedColor,
                        isRadio: true,
                      ),
                    ],
                  ),
                  SizedBox(height: 26.h),
                  SettingsOptionBox(
                    hasButton: true,
                    title: 'Auto - Rotation',
                    subtitle:
                        'Automatically change your wallpaper at regular intervals',
                    child: Switch(
                      onChanged: (newValue) {
                        setState(() {
                          autoRotation = newValue;
                        });
                      },
                      value: autoRotation,
                      activeColor: Colors.white,
                      activeTrackColor: AppTheme.selectedColor,
                      inactiveThumbColor: AppTheme.buttonColor,
                      inactiveTrackColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 26.h),

                  ///ADD OPTION PICKER
                  Text(
                    'Advanced Settings',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 20.sp,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8.h),

                  SettingOption(
                    title: 'Lock Wallpaper',
                    subtitle: 'Prevent accidental changes',
                    activeColor: AppTheme.buttonColor,
                    isRadio: false,
                    isChecked: _isLockWallpaperEnabled,
                    onCheck: () {
                      setState(() {
                        _isLockWallpaperEnabled = !_isLockWallpaperEnabled;
                      });
                    },
                  ),
                  SizedBox(height: 18.h),
                  SettingOption(
                    title: 'Sync Across Devices',
                    subtitle: 'Keep wallpaper consistent on all devices',
                    activeColor: AppTheme.buttonColor,
                    isRadio: false,
                    isChecked: _isSyncEnabled,
                    onCheck: () {
                      setState(() {
                        _isSyncEnabled = !_isSyncEnabled;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 26.h),
          !widget.isMediumScreen
              ? Row(
                  spacing: 20,
                  children: [
                    Spacer(),
                    CustomButton(
                      buttonText: 'Cancel',
                      textColor: Colors.black,
                      hasIcon: false,
                      isOutlined: true,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    CustomButton(
                      onTap: () {
                        widget.onSet();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>MainHome(),
                          ),
                        );                      },
                      buttonText: 'Save Settings',
                      textColor: Colors.black,
                      hasIcon: false,
                      isOutlined: false,
                    ),
                  ],
                )
              : Column(
                  spacing: 20,
                  children: [
                    CustomButton(
                      buttonText: 'Cancel',
                      textColor: Colors.black,
                      hasIcon: false,
                      isOutlined: true,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    CustomButton(
                      onTap: () {
                        widget.onSet();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainHome()),
                        );
                      },
                      buttonText: 'Save Settings',
                      textColor: Colors.black,
                      hasIcon: false,
                      isOutlined: false,
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
