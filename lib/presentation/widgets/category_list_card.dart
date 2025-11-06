import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_studio/presentation/themes/app_theme.dart';

import '../../data/models/category.dart';
import 'gradient_chip.dart';

class ListCard extends StatefulWidget {
  final Category category;
  final String? title;
  final VoidCallback? onTap;
  final IconData? icon;
  final bool isWallpaper;
  final String? wallpaper;

  const ListCard({super.key, this.onTap, required this.category, this.title, this.icon, required this.isWallpaper, this.wallpaper});

  @override
  State<ListCard> createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.widthOf(context);
    // final height = MediaQuery.heightOf(context);
    final bool isNarrowScreen = width < 650;
    // final bool isMediumScreen = width < 850;


    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.h),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: isNarrowScreen ? 150.h : 185.12.h,
                width: isNarrowScreen ? 150.w : 277.21.w,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.56.r),
                ),
                child: Stack(
                  children: [
                    AnimatedScale(
                      scale: _hovered ? 1.2 : 1.0,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeInOut,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(widget.isWallpaper ? widget.wallpaper.toString() : widget.category.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(0, 0, 0, 0.3),

                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: 20.w),

              // Texts and chip
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title ?? widget.category.title,
                      style: widget.isWallpaper ? Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black) : Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.black),
                    ),
                    SizedBox(height: 4.h),
                    Visibility(
                      visible: !widget.isWallpaper,
                      child: Text(
                        widget.category.desc,
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.black),
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    InfoChip(
                      label:  widget.isWallpaper
                          ? widget.category.title
                          : '${widget.category.wallpapers.length} Wallpapers',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

