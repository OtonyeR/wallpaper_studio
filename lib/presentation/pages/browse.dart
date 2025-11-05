import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_studio/presentation/widgets/icon_button.dart';

import '../../data/models/category.dart';
import '../themes/app_theme.dart';
import '../widgets/cat_grid.dart';
import '../widgets/cat_list.dart';
import '../widgets/gradient_text.dart';
import 'cat_details.dart';

class BrowsePage extends StatefulWidget {
  final ValueChanged<int> onNavigate;
  const BrowsePage({super.key, required this.onNavigate});

  @override
  State<BrowsePage> createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {

  bool _isGridView = true;
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.widthOf(context);
    // final height = MediaQuery.heightOf(context);
    final bool isNarrowScreen = width < 650;
    // final bool isMediumScreen = width < 850;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GradientText(
              'Browse Categories',
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: Colors.white,
                fontSize: isNarrowScreen ? 24.sp : 60.sp,
              ),
              gradient: AppTheme.headingGradient,
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: width * 0.55,
                  child: Text(
                    'Explore our curated collections of stunning wallpapers',
                    overflow: TextOverflow.visible,
                    softWrap: true,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: isNarrowScreen ? 16.sp : 24.sp,
                    ),
                  ),
                ),
                Spacer(),

                !isNarrowScreen
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomIconButton(
                            iconName: _isGridView ? 'grid_active' : 'grid',
                            iconColor: _isGridView ? AppTheme.secondary : null,
                            iconAccent:  _isGridView ? AppTheme.accent : null,
                            buttonHeight: 34.h,
                            buttonWidth: 34.w,
                            radius: 6.r,
                            iconPadding: EdgeInsets.all(6.w),
                            onTap: () {
                              setState(() {
                                _isGridView = true;
                              });
                            },
                          ),

                          SizedBox(width: 8.w),
                          CustomIconButton(
                            iconName: !_isGridView ? 'rows_active' : 'rows',
                            iconColor: !_isGridView ? AppTheme.secondary : null,
                            iconAccent:  !_isGridView ? AppTheme.accent : Colors.transparent,
                            buttonHeight: 34.h,
                            buttonWidth: 34.w,
                            radius: 6.r,
                            iconPadding: EdgeInsets.all(6.w),
                            onTap: () {
                              setState(() {
                                _isGridView = false;
                              });
                            },
                          ),
                        ],
                      )
                    : CustomIconButton(
                        iconName: _isGridView
                            ? 'grid_active'
                            : !_isGridView
                            ? 'rows_active'
                            : 'rows',
                        iconColor: AppTheme.secondary,
                        iconAccent: AppTheme.accent,
                        buttonHeight: 36.h,
                        buttonWidth: 36.w,
                        radius: 6.r,
                        iconPadding: EdgeInsets.all(6.w),
                        onTap: () {
                          setState(() {
                            _isGridView = !_isGridView;
                          });
                        },
                      ),
              ],
            ),
          ],
        ),

        SizedBox(height: isNarrowScreen ? 32.h : 50.h),
        //Categories View
        SizedBox(height: 12.h),
        Expanded(
          child: _isGridView
              ? CategoriesGrid(
                  categoriesList: categoriesList,
                  onTap: (Category value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryDetails(category: value),
                      ),
                    );
                  },
                )
              : CategoriesList(
                  categoriesList: categoriesList,
                  onTap: (Category value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryDetails(category: value),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
