import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_studio/core/wallpaper_prefs.dart';
import 'package:wallpaper_studio/data/models/wallpaper.dart';
import 'package:wallpaper_studio/data/wallpapers.dart';
import 'package:wallpaper_studio/presentation/pages/cat_details.dart';

import 'package:wallpaper_studio/presentation/widgets/gradient_text.dart';

import '../../data/models/category.dart';
import '../themes/app_theme.dart';
import '../widgets/cat_grid.dart';
import '../widgets/current_wp_box.dart';

class Home extends StatefulWidget {
  final ValueChanged<int> onNavigate;

  const Home({super.key, required this.onNavigate});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final styles = AppTheme();
  Wallpaper? currentWallpaper;


  void getCurrent() async {
    final id = await WallpaperPrefs.getCurrentWallpaper();
    setState(() {
      currentWallpaper = wallpaperList.firstWhere((wall) => wall.id == id,);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrent();
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
        SizedBox(
          child:
          currentWallpaper != null ? CurrentWallpaperBox(
            width: width,
            height: 200,
            wallpaper: currentWallpaper!,
            isMediumScreen: isMediumScreen,
            isNarrowScreen: isNarrowScreen,) :
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GradientText(
                'Discover Beautiful Wallpapers',
                style: Theme
                    .of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(
                  color: Colors.white,
                  fontSize: isNarrowScreen ? 24.sp : 60.sp,
                ),
                gradient: AppTheme.headingGradient,
              ),
              SizedBox(height: 8.h),
              Text(
                'Discover curated collections of stunning wallpapers. Browse by category, preview in full-screen, and set your favorites.',
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(
                  fontSize: isNarrowScreen ? 16.sp : 24.sp,
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 50.h),
        //Categories View
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Categories',
              style: isNarrowScreen
                  ? Theme
                  .of(
                context,
              )
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 20.sp)
                  : Theme
                  .of(context)
                  .textTheme
                  .bodyLarge,
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'See All',
                style: isNarrowScreen
                    ? Theme
                    .of(
                  context,
                )
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 16.sp)
                    : Theme
                    .of(context)
                    .textTheme
                    .bodyMedium,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Expanded(
          child: CategoriesGrid(
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
