import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpaper_studio/data/models/wallpaper.dart';
import 'package:wallpaper_studio/presentation/widgets/custom_button.dart';

import '../../core/wallpaper_prefs.dart';
import '../themes/app_theme.dart';
import '../widgets/category_grid_card.dart';
import '../widgets/category_list_card.dart';
import '../widgets/gradient_text.dart';
import '../widgets/icon_button.dart';

class FavouritesPage extends StatefulWidget {
  final ValueChanged<int> onNavigate;
  final List<Wallpaper> allWallpapers;

  const FavouritesPage({super.key, required this.onNavigate, required this.allWallpapers});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  bool _isGridView = true;
  List<Wallpaper> _faveWallpapers = [];
  List<Wallpaper> _allWallpapers = [];


  Future<void> _loadPreferences() async {
    final favourites = await WallpaperPrefs.getSavedWallpapers();

    setState(() {
      _faveWallpapers = _allWallpapers.where((wallpaper) {
        return favourites.contains(wallpaper.id);
      }).toList();
    });
  }

  Future<void> _handleToggleSave(Wallpaper wallpaper) async {
    final success = await WallpaperPrefs.toggleSavedWallpaper(wallpaper.id);

    if (success) {
      setState(() {
        if (_faveWallpapers.contains(wallpaper)) {
          _faveWallpapers.remove(wallpaper);
        } else {
          _faveWallpapers.add(wallpaper);
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _allWallpapers = widget.allWallpapers;
    _loadPreferences();
  }

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
              'Saved Wallpapers',
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
                    'Your saved wallpapers collection',
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
                            iconAccent: _isGridView ? AppTheme.accent : null,
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
                            iconAccent: !_isGridView
                                ? AppTheme.accent
                                : Colors.transparent,
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
          child: _faveWallpapers.isEmpty
              ? Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/empty.svg'),
                      SizedBox(height: 50.h),
                      Text(
                        'No Saved Wallpapers',
                        style: Theme.of(context).textTheme.headlineMedium!
                            .copyWith(color: AppTheme.textSecondary),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        'Start saving your favorite wallpapers to see them here',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall!
                            .copyWith(color: AppTheme.textSecondary, fontSize: 14.sp),
                      ),
                      SizedBox(height: 20),
                        CustomButton(
                          onTap: () {
                            widget.onNavigate(1);
                          },
                          width: isNarrowScreen ? width * 0.6 : width * 0.2,
                          buttonText: 'Browse Wallpapers',
                          textColor: Colors.white,
                          hasIcon: false,
                          isOutlined: false,
                      ),
                    ],
                  ),
              )
              : _isGridView
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: width >= 900 ? 6 : 2,
                    crossAxisSpacing: 20.w,
                    mainAxisSpacing: 23.h,
                    mainAxisExtent: 350.h,
                  ),
                  itemCount: _faveWallpapers.length,
                  itemBuilder: (context, index) {
                    final wall = _faveWallpapers[index];
                    return GridCard(
                      category: wall.category,
                      wallpaper: wall.assetPath,
                      title: wall.title,
                      isWallpaper: true,
                      isSelected: false,
                      isSaved: true,
                      onSave: () {
                        _handleToggleSave(wall);
                      },
                    );
                  },
                )
              : ListView.separated(
                  itemCount: _faveWallpapers.length,
                  separatorBuilder: (context, index) => SizedBox(height: 12.h),
                  itemBuilder: (context, index) {
                    final wall = _faveWallpapers[index];
                    return ListCard(
                      onTap: () {},
                      category: wall.category,
                      isWallpaper: true,
                      wallpaper: wall.assetPath,
                      title: wall.title,
                    );
                  },
                ),
        ),
      ],
    );
  }
}
