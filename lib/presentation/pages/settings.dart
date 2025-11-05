import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpaper_studio/presentation/widgets/settings_option.dart';

import '../themes/app_theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/gradient_text.dart';

class SettingsPage extends StatefulWidget {
  final ValueChanged<int> onNavigate;

  const SettingsPage({super.key, required this.onNavigate});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String? _selectedOption;
  bool _isNotificationEnabled = false;

  final List<String> _options = [
    'Highest (4K UHD)',
    'High (Full HD)',
    'Medium (HD)',
    'Low (SD)',
  ];

  @override
  void initState() {
    super.initState();
    _selectedOption = _options.first;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.widthOf(context);
    final height = MediaQuery.heightOf(context);
    final bool isNarrowScreen = width < 650;
    final bool isMediumScreen = width < 850;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GradientText(
          'Settings',
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
            color: Colors.white,
            fontSize: isNarrowScreen ? 24.sp : 60.sp,
          ),
          gradient: AppTheme.headingGradient,
        ),
        SizedBox(height: 8.h),
        SizedBox(
          child: Text(
            'Customize your Wallpaper Studio experience',
            overflow: TextOverflow.visible,
            softWrap: true,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontSize: isNarrowScreen ? 16.sp : 24.sp,
            ),
          ),
        ),
        SizedBox(height: 50.h),

        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                margin: isMediumScreen
                    ? EdgeInsets.only(bottom: 26.01.h)
                    : null,
                padding: EdgeInsets.symmetric(
                  horizontal: 50.w,
                  vertical: 51.5.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(36.r),
                  border: Border.all(color: Colors.black.withAlpha(26)),
                ),

                // Smaller Screen
                child: isMediumScreen
                    ? SingleChildScrollView(
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Wallpaper Setup',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineMedium,
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  'Configure your wallpaper settings and enable auto-rotation',
                                  style: Theme.of(context).textTheme.bodySmall!
                                      .copyWith(color: Colors.black),
                                ),
                                SizedBox(height: 26.h),
                                SettingsOptionBox(
                                  title: 'Image Quality',
                                  subtitle:
                                      'Select the resolution for downloaded images.',
                                  hasButton: false,
                                  stackedWidget: _buildRoundedDropdown(),
                                ),

                                SizedBox(height: 20.h),
                                SettingsOptionBox(
                                  title: 'Notification',
                                  hasButton: true,
                                  subtitle:
                                      'Get notified about new wallpapers and updates',
                                  child: Switch(
                                    value: _isNotificationEnabled,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _isNotificationEnabled = newValue;
                                      });
                                    },
                                    activeColor: Colors.white,
                                    activeTrackColor: AppTheme.selectedColor,
                                    inactiveThumbColor: AppTheme.buttonColor,
                                    inactiveTrackColor: Colors.white,
                                  ),
                                ),

                                SizedBox(height: 40.h),

                                Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CustomButton(
                                        buttonText: 'Save to Favourites',
                                        textColor: Colors.black,
                                        hasIcon: false,
                                        isOutlined: true,
                                      ),
                                      SizedBox(height: 20.h),
                                      CustomButton(
                                        buttonText: 'Set to Wallpaper',
                                        textColor: Colors.black,
                                        hasIcon: false,
                                        isOutlined: false,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 40.h),

                            Center(
                              child: DeviceFrame(
                                device: Devices.ios.iPhone15ProMax,
                                isFrameVisible: true,
                                orientation: Orientation.portrait,
                                screen: Container(
                                  color: Colors.white,
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: EdgeInsets.all(16.w),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      'Make a Selection to see Preview',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    //Large View
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Wallpaper Setup',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineMedium,
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  'Configure your wallpaper settings and enable auto-rotation',
                                  style: Theme.of(context).textTheme.bodySmall!
                                      .copyWith(color: Colors.black),
                                ),
                                SizedBox(height: 26.h),
                                SettingsOptionBox(
                                  title: 'Image Quality',
                                  subtitle:
                                      'Select the resolution for downloaded images.',
                                  hasButton: false,
                                  stackedWidget: _buildRoundedDropdown(),
                                ),

                                SizedBox(height: 20.h),
                                SettingsOptionBox(
                                  title: 'Notification',
                                  hasButton: true,
                                  subtitle:
                                      'Get notified about new wallpapers and updates',
                                  child: Switch(
                                    value: _isNotificationEnabled,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _isNotificationEnabled = newValue;
                                      });
                                    },
                                    activeColor: Colors.white,
                                    activeTrackColor: AppTheme.selectedColor,
                                    inactiveThumbColor: AppTheme.buttonColor,
                                    inactiveTrackColor: Colors.white,
                                  ),
                                ),
                                const Spacer(),

                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CustomButton(
                                        buttonText: 'Save to Favourites',
                                        textColor: Colors.black,
                                        hasIcon: false,
                                        isOutlined: true,
                                      ),
                                      SizedBox(width: 20.w),
                                      CustomButton(
                                        buttonText: 'Set to Wallpaper',
                                        textColor: Colors.black,
                                        hasIcon: false,
                                        isOutlined: false,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(width: 40.w),

                          Expanded(
                            flex: 1,
                            child: DeviceFrame(
                              device: Devices.ios.iPhone15ProMax,
                              isFrameVisible: true,
                              orientation: Orientation.portrait,
                              screen: Container(
                                color: Colors.white,
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(33.76.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: width * 0.17,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 13.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppTheme.successBg,
                                        borderRadius: BorderRadius.circular(
                                          40.r,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            'assets/icons/link.svg',
                                            height: 24.h,
                                            width: 24.w,
                                          ),
                                          SizedBox(width: 11.w),

                                          Text(
                                            textAlign: TextAlign.center,
                                            'Click to Disconnect',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium!
                                                .copyWith(
                                                  color: AppTheme.successText,
                                                  fontSize: 12.sp,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 11.h),
                                    Text(
                                      textAlign: TextAlign.center,
                                      'Click to Disconnect',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium!
                                          .copyWith(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRoundedDropdown() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black.withAlpha(50)),
        borderRadius: BorderRadius.circular(12.0.r),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedOption,
          isExpanded: true,
          dropdownColor: Colors.white,
          borderRadius: BorderRadius.circular(12.0.r),
          onChanged: (String? newValue) {
            setState(() {
              _selectedOption = newValue;
            });
          },
          items: _options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Color.fromARGB(255, 156, 156, 156),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget buildDropdownSetting({
    required BuildContext context,
    required String title,
    String? subtitle,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(36.r),
        border: Border.all(color: Colors.black.withAlpha(26)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            overflow: TextOverflow.visible,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: Colors.black),
          ),
          if (subtitle != null) ...[
            SizedBox(height: 4.h),
            Text(
              subtitle,
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.copyWith(color: Colors.black54),
            ),
          ],
          SizedBox(height: 12.h),
          child,
        ],
      ),
    );
  }
}
