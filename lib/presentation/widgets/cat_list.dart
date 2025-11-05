import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/models/category.dart';
import 'category_grid_card.dart';
import 'category_list_card.dart';

class CategoriesList extends StatelessWidget {
  final List<Category> categoriesList;
  final ValueChanged<Category> onTap;

  const CategoriesList({
    super.key,
    required this.categoriesList,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return _buildList(context, categoriesList);
  }

  Widget _buildList(BuildContext context, List<Category> items) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ListView.separated(
          itemCount: items.length,
          separatorBuilder: (context, index) => SizedBox(height: 12.h),
          itemBuilder: (context, index) => ListCard(
            category: items[index],
            isWallpaper: false,
            onTap: () => onTap.call(items[index]),
          ),
        );
      },
    );
  }
}
