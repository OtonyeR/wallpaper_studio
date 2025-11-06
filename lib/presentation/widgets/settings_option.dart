import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/app_theme.dart';

class SettingsOptionBox extends StatefulWidget {
  final String title;
  String? subtitle;
  final Widget? child;
  final Widget? stackedWidget;
  final bool hasButton;

  SettingsOptionBox({
    super.key,
    required this.title,
    this.child,
    required this.hasButton,
    this.subtitle,
    this.stackedWidget,
  });

  @override
  State<SettingsOptionBox> createState() => _SettingsOptionBoxState();
}

class _SettingsOptionBoxState extends State<SettingsOptionBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(36.r),
        border: Border.all(color: Colors.black.withAlpha(26)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  overflow: TextOverflow.visible,
                  softWrap: true,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: Colors.black),
                ),
                if (widget.subtitle != null) ...[
                  SizedBox(height: 8.h),
                  Text(
                    widget.subtitle!,
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall!.copyWith(color: Colors.black54),
                  ),
                ],
                if (widget.stackedWidget != null) ...[
                  SizedBox(height: 8.h),
                  widget.stackedWidget!,
                ],
              ],
            ),
          ),
          SizedBox(width: 10.w),
          widget.hasButton ? widget.child! : Container(),
        ],
      ),
    );
  }
}

class SettingOption<T> extends StatelessWidget {
  final String title;
  final String? subtitle;
  final T? value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final Color? activeColor;
  final bool isRadio;
  final bool? isChecked;
  final void Function()? onCheck;

  const SettingOption({
    super.key,
    required this.title,
    this.subtitle,
    this.value,
    this.groupValue,
    this.onChanged,
    this.activeColor,
    required this.isRadio,
    this.isChecked, this.onCheck,
  });

  bool get isSelected => value == groupValue;

  Widget _buildControl(bool isSelected, BuildContext context) {
    if (isRadio) {
      return Container(
        height: 32.r,
        width: 32.r,
        padding: EdgeInsets.all(3.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32.r),
          border: Border.all(
            width: 1.0,
            color: isSelected
                ? AppTheme.selectedColor
                : const Color.fromARGB(255, 216, 216, 216),
          ),
        ),
        child: Center(
          child: Container(
            height: 20.r,
            width: 20.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32.r),
              color: isSelected ? AppTheme.selectedColor : Colors.white,
            ),
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: onCheck,
        child: Container(
          padding: EdgeInsets.all(2.r),
          alignment: Alignment.center,
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6.99.r),
              border: Border.all(
                color: isChecked != null
                    ? AppTheme.selectedColor
                    : const Color.fromARGB(255, 216, 216, 216),
                width: 1.0,
              ),
            ),
            child: isChecked != null ? isChecked!
                ? Padding(
                    padding: EdgeInsets.all(4.r),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.36.r),
                        color: AppTheme.selectedColor,
                      ),
                    ),
                  )
                : null : null,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;

    return GestureDetector(
      onTap: () => onChanged!(value),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(36.r),
          border: Border.all(color: Colors.black.withAlpha(26)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildControl(isSelected, context),

            SizedBox(width: 12.5.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.visible,
                    softWrap: true,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(color: Colors.black),
                  ),
                  if (subtitle != null) ...[
                    SizedBox(height: 8.h),
                    Text(
                      subtitle!,
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall!.copyWith(color: Colors.black54),
                    ),
                  ],
                ],
              ),
            ),
            SizedBox(width: 10.w),
          ],
        ),
      ),
    );
  }
}
