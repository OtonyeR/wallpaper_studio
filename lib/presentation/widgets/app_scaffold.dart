import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../themes/app_theme.dart';
import 'bar_icons.dart';

class CustomScaffold extends StatelessWidget {
  final String? title;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final bool centerTitle;
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;
  final Widget body;
  final int selectedIndex;

  // New callback to notify the parent when an action button is tapped
  final ValueChanged<int> onNavigationTapped;

  CustomScaffold({
    super.key,
    this.title,
    this.appBar,
    this.floatingActionButton,
    this.centerTitle = true,
    this.backgroundColor = Colors.white,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    required this.body,
    required this.selectedIndex,
    required this.onNavigationTapped, // Required for navigation control
  });

  // Since it's Stateless, all logic moves into the build method or helper functions
  final List<Map<String, dynamic>> actionsList = [
    {'label': 'Home', 'icon': 'home'},
    {'label': 'Browse', 'icon': 'browse'},
    {'label': 'Favourites', 'icon': 'heart'},
    {'label': 'Settings', 'icon': 'settings'},
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.widthOf(context);
    final bool isNarrowScreen = width < 650;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.background,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          shadowColor: const Color.fromRGBO(1, 1, 1, 0.1),
          toolbarHeight: 98.h,
          titleSpacing: isNarrowScreen ? 20.w : 67.w,
          actionsPadding: isNarrowScreen
              ? EdgeInsets.only(right: 20.w)
              : EdgeInsets.only(right: 47.w),
          title: Row(
            children: [
              SvgPicture.asset('assets/logo.svg', height: 16.h, width: 16.w),
              SizedBox(width: 8.w),
              Text(
                'Wallpaper Studio',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 2,
          centerTitle: false,
          actions: isNarrowScreen
              ? [
                  Builder(
                    builder: (context) {
                      return IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () => Scaffold.of(context).openEndDrawer(),
                      );
                    },
                  ),
                ]
              : actionsList.asMap().entries.map((entry) {
                  final int index = entry.key;
                  final Map<String, dynamic> item = entry.value;

                  return BarIcon(
                    iconName: item['icon'],
                    label: item['label'],
                    // Use widget.selectedIndex
                    isSelected: selectedIndex == index,
                    onTap: () {
                      onNavigationTapped(index);
                    },
                  );
                }).toList(),
        ),
        drawer: null,

        endDrawer: isNarrowScreen
            ? Drawer(
                width: width * 0.84,
                shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.zero,
                  side: BorderSide.none,
                ),
                backgroundColor: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.h,
                  ),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,

                    itemCount: actionsList.length,

                    itemBuilder: (context, index) {
                      final item = actionsList[index];

                      return GestureDetector(
                        onTap: () {
                          onNavigationTapped(index);
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 18.h,

                            horizontal: 16.w,
                          ),

                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide.none,

                              bottom: BorderSide(
                                color: AppTheme.borderColorSecondary,

                                width: 1.0,
                              ),
                            ),
                          ),

                          child: Row(
                            spacing: 10.w,

                            children: [
                              SvgPicture.asset(
                                'assets/icons/${item['icon']}.svg',

                                height: 24.h,

                                width: 24.w,
                              ),

                              Text(
                                item['label'],

                                style: Theme.of(context).textTheme.bodySmall!
                                    .copyWith(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            : null,
        body: Padding(
          padding: isNarrowScreen
              ? EdgeInsets.only(left: 20.w, right: 20.w, top: 37.h, bottom: 0)
              : EdgeInsets.only(
                  left: 47.w,
                  right: 47.w,
                  top: 52.63.h,
                  bottom: 45.94.h,
                ),
          child: body,
        ),
      ),
    );
  }
}
