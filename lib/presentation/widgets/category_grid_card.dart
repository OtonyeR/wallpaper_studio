import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpaper_studio/presentation/themes/app_theme.dart';

import '../../data/models/category.dart';
import 'gradient_chip.dart';

class GridCard extends StatefulWidget {
  final Category category;
  final String? title;
  final VoidCallback? onTap;
  final IconData? icon;
  final bool isWallpaper;
  final String? wallpaper;
  final bool isSelected;
  final VoidCallback? onSave;
  final bool? isSaved;

  const GridCard({
    super.key,
    this.onTap,
    required this.category,
    this.icon,
    required this.isWallpaper,
    this.title,
    this.wallpaper,
    required this.isSelected,
    this.onSave,
    this.isSaved,
  });

  @override
  State<GridCard> createState() => _GridCardState();
}

class _GridCardState extends State<GridCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.widthOf(context);
    final height = MediaQuery.heightOf(context);
    final bool isNarrowScreen = width < 650;
    final bool isMediumScreen = width < 850;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          // width: 435.33.w,
          // height: 290.72.h,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(26.r)),
          child: Stack(
            children: [
              AnimatedScale(
                scale: _hovered ? 1.2 : 1.0,
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOut,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        widget.isWallpaper
                            ? widget.wallpaper.toString()
                            : widget.category.imageUrl,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // Semi-transparent overlay
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.3),
                  borderRadius: BorderRadius.circular(26.r),
                  border: widget.isWallpaper
                      ? widget.isSelected
                            ? Border.all(
                                color: AppTheme.selectedColor,
                                width: 2.w,
                              )
                            : null
                      : null,
                ),
              ),

              //Save to Favourites

              // Texts and chip
              Positioned(
                left: 25.w,
                bottom: 18.71.h,
                right: 25.w,
                child: Column(
                  spacing: 4.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title ?? widget.category.title,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: widget.isWallpaper
                          ? Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.white,
                            )
                          : Theme.of(context).textTheme.labelMedium,
                    ),
                    Visibility(
                      visible: !widget.isWallpaper,
                      child: Text(
                        widget.category.desc,
                        style: Theme.of(context).textTheme.labelSmall,
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                    GradientGlassChip(
                      height: widget.isWallpaper ? 72.h : null,
                      label: widget.isWallpaper
                          ? widget.category.title
                          : '${widget.category.wallpapers.length} Wallpapers',
                    ),
                  ],
                ),
              ),

              // Save Button
              widget.isWallpaper
                  ? Positioned(
                top: 12.h,
                right: 13.8.w,
                child: GestureDetector(
                  onTap: widget.onSave ?? (){},
                  child: widget.isSaved != true
                      ? GradientGlassChip(
                    label: 'label',
                    width: 40.w,
                    height: 40.h,
                    child: SvgPicture.asset(
                      'assets/icons/save.svg',
                    ),
                  )
                      : CircleAvatar(
                    radius: 22.r,
                    backgroundColor: Colors.white,
                    child: SvgPicture.asset(
                      'assets/icons/saved.svg',
                    ),
                  ),
                ),
              )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
