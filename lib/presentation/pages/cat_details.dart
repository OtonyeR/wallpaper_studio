import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpaper_studio/data/models/wallpaper.dart';
import 'package:wallpaper_studio/presentation/pages/main_home.dart';
import 'package:wallpaper_studio/presentation/pages/wallpaper_preview.dart';

import '../../core/wallpaper_prefs.dart';
import '../../data/models/category.dart';
import '../themes/app_theme.dart';
import '../widgets/category_grid_card.dart';
import '../widgets/category_list_card.dart';
import '../widgets/custom_button.dart';
import '../widgets/icon_button.dart';

enum DisplayMode { fit, fill, stretch, tile }

class CategoryDetails extends StatefulWidget {
  final Category category;

  const CategoryDetails({super.key, required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  bool _isGridView = true;
  late Wallpaper _selectedWallpaper;
  Set<String> _savedWallpaperIds = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedWallpaper = widget.category.wallpapers.first;
    _loadSavedWallpapers();
  }

  Future<void> _loadSavedWallpapers() async {
    final savedList = await WallpaperPrefs.getSavedWallpapers();
    setState(() {
      _savedWallpaperIds = savedList.toSet();
    });
  }

  Future<void> _handleToggleSave(Wallpaper wallpaper) async {
    final success = await WallpaperPrefs.toggleSavedWallpaper(wallpaper.id);

    if (success) {
      setState(() {
        if (_savedWallpaperIds.contains(wallpaper.id)) {
          _savedWallpaperIds.remove(wallpaper.id);
        } else {
          _savedWallpaperIds.add(wallpaper.id);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.widthOf(context);
    // final height = MediaQuery.heightOf(context);
    final bool isNarrowScreen = width < 650;
    final bool isMediumScreen = width < 850;

    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Padding(
        padding: isNarrowScreen
            ? EdgeInsets.only(left: 20.w, right: 20.w, top: 37.h, bottom: 0)
            : EdgeInsets.only(
          left: 47.w,
          right: 47.w,
          top: 52.63.h,
          bottom: 45.94.h,
        ),        child: Row(
          children: [
            //Wallpapers Grid
            Flexible(
              flex: 1,
              child: Container(
                margin: isMediumScreen ? EdgeInsets.all(20.w) : null,
                padding: EdgeInsets.only(right: !isMediumScreen ? 40.w : 0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_back_rounded, color: Colors.black),
                          SizedBox(width: 2.42.w),
                          Text(
                            'Back to Categories',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.category.title,
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        !isNarrowScreen
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CustomIconButton(
                                    iconName: _isGridView
                                        ? 'grid_active'
                                        : 'grid',
                                    iconColor: _isGridView
                                        ? AppTheme.secondary
                                        : null,
                                    iconAccent: _isGridView
                                        ? AppTheme.accent
                                        : null,
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
                                    iconName: !_isGridView
                                        ? 'rows_active'
                                        : 'rows',
                                    iconColor: !_isGridView
                                        ? AppTheme.secondary
                                        : null,
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
                    SizedBox(height: 24.h),
                    Expanded(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          if (widget.category.wallpapers == []) {
                            return Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset('assets/empty.svg'),
                                  SizedBox(height: 50.h),
                                  Text(
                                    'No Wallpapers',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(color: AppTheme.textSecondary),
                                  ),
                                  SizedBox(height: 12.h),
                                  Text(
                                    'Start adding your wallpapers to see them here',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.bodySmall!
                                        .copyWith(
                                          color: AppTheme.textSecondary,
                                          fontSize: 14.sp,
                                        ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomButton(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MainHome(),
                                        ),
                                      );
                                    },
                                    width: isNarrowScreen
                                        ? width * 0.6
                                        : width * 0.2,
                                    buttonText: 'Browse Wallpapers',
                                    textColor: Colors.white,
                                    hasIcon: false,
                                    isOutlined: false,
                                  ),
                                ],
                              ),
                            );
                          }

                          return _isGridView
                              ? GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: width >= 950 ? 3 : 2,
                                        crossAxisSpacing: 20.w,
                                        mainAxisSpacing: 23.h,
                                        mainAxisExtent: 290.71.h,
                                      ),
                                  itemCount: widget.category.wallpapers.length,
                                  itemBuilder: (context, index) {
                                    final wall =
                                        widget.category.wallpapers[index];
                                    print(constraints.maxWidth);

                                    final bool isWallSaved = _savedWallpaperIds
                                        .contains(wall.id);

                                    return GridCard(
                                      onTap: () {
                                        if (isMediumScreen) {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext sheetContext) {
                                              return WallpaperPreview(
                                                isMediumScreen: isMediumScreen,
                                                width: width,
                                                selectedWallpaper: widget
                                                    .category
                                                    .wallpapers[index],
                                              );
                                            },
                                          );
                                        } else {
                                          setState(() {
                                            _selectedWallpaper =
                                                widget.category.wallpapers[index];
                                          });
                                        }
                                      },
                                      category: widget.category,
                                      wallpaper: wall.assetPath,
                                      onSave: () {
                                        _handleToggleSave(wall);
                                      },
                                      isSaved: isWallSaved,
                                      title:
                                          widget.category.wallpapers[index].title,
                                      isWallpaper: true,
                                      isSelected:
                                          _selectedWallpaper ==
                                          widget.category.wallpapers[index],
                                    );
                                  },
                                )
                              : ListView.separated(
                                  itemCount: widget.category.wallpapers.length,
                                  separatorBuilder: (context, index) =>
                                      SizedBox(height: 12.h),
                                  itemBuilder: (context, index) => ListCard(
                                    onTap: () {
                                      if (isMediumScreen) {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext sheetContext) {
                                            return WallpaperPreview(
                                              isMediumScreen: isMediumScreen,
                                              width: width,
                                              selectedWallpaper: widget
                                                  .category
                                                  .wallpapers[index],
                                            );
                                          },
                                        );
                                      } else {
                                        setState(() {
                                          _selectedWallpaper =
                                              widget.category.wallpapers[index];
                                        });
                                      }
                                    },
                                    category: widget.category,
                                    isWallpaper: true,
                                    wallpaper: widget
                                        .category
                                        .wallpapers[index]
                                        .assetPath,
                                    title:
                                        widget.category.wallpapers[index].title,
                                  ),
                                );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Mockup Preview
            Visibility(
              visible: !isMediumScreen,
              child: WallpaperPreview(
                isMediumScreen: isNarrowScreen,
                width: width,
                selectedWallpaper: _selectedWallpaper,
              ),
            ),
          ],
        ),
      ),


    );
  }
}
