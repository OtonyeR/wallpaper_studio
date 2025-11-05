import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/category.dart';
import 'category_grid_card.dart';

class CategoriesGrid extends StatelessWidget {
  final List<Category> categoriesList;
  final ValueChanged<Category> onTap;

  const CategoriesGrid({
    super.key,
    required this.categoriesList,
    required this.onTap,
  });

  int _columnsForWidth(double width) {
    if (width >= 1000) return 3;
    if (width >= 900) return 2;
    if (width <= 500) return 1;
    return 2;
  }

  @override
  Widget build(BuildContext context) {
    return _buildGrid(context, categoriesList);
  }

  Widget _buildGrid(BuildContext context, List<Category> items) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cols = _columnsForWidth(constraints.maxWidth);
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: cols,
            crossAxisSpacing: 20.w,
            mainAxisSpacing: 23.h,
            mainAxisExtent: 290.71.h,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final cat = items[index];
            return GridCard(
              onTap: () => onTap.call(cat),
              category: cat,
              isWallpaper: false,
              isSelected: false,
            );
          },
        );
      },
    );
  }
}

// class WallpaperGrid extends StatelessWidget {
//   final Category category;
//   final List<String> wallpaperList;
//   final ValueChanged<Category> onTap;
//
//   const WallpaperGrid({
//     super.key,
//     required this.wallpaperList,
//     required this.onTap,
//     required this.category,
//   });
//
//   int _columnsForWidth(double width) {
//     if (width >= 1000) return 3;
//     if (width >= 900) return 2;
//     if (width <= 500) return 1;
//     return 2;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return _buildGrid(context, wallpaperList);
//   }
//
//   Widget _buildGrid(BuildContext context, List<String> items) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final cols = _columnsForWidth(constraints.maxWidth);
//         return GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: cols,
//             crossAxisSpacing: 20.w,
//             mainAxisSpacing: 23.h,
//             mainAxisExtent: 290.71.h,
//           ),
//           itemCount: items.length,
//           itemBuilder: (context, index) {
//             final wall = items[index];
//             return GridCard(
//               onTap: () {},
//               category: category,
//               isWallpaper: false,
//               wallpaper: wall,
//             );
//           },
//         );
//       },
//     );
//   }
// }
