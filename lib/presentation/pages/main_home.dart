import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpaper_studio/presentation/widgets/app_scaffold.dart';
import 'package:window_manager/window_manager.dart';

// Assuming these imports exist and are correct
import '../../data/models/category.dart';
import '../../data/wallpapers.dart';
import '../pages/browse.dart';
import '../pages/cat_details.dart';
import '../pages/favourites.dart';
import '../pages/home.dart';
import '../pages/settings.dart';
import '../themes/app_theme.dart';

class MainHome extends StatefulWidget {
  final String? title;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final bool centerTitle;
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;

  const MainHome({
    super.key,
    this.title,
    this.appBar,
    this.floatingActionButton,
    this.centerTitle = true,
    this.backgroundColor = Colors.white,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  });

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int _selectedIndex = 0;

  late final List<Widget> _pages;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    // 2. Initialize the list here, where _onItemTapped is safe to access
    _pages = [
      // Pass the instance method here.
      Home(onNavigate: _onItemTapped),
      BrowsePage(onNavigate: _onItemTapped),
      FavouritesPage(onNavigate: _onItemTapped, allWallpapers: wallpaperList,),
      SettingsPage(onNavigate: _onItemTapped),
    ];
  }


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.widthOf(context);
    // final height = MediaQuery.heightOf(context);

    final bool isNarrowScreen = width < 650;

    return CustomScaffold(
      body: _pages[_selectedIndex],

      selectedIndex: _selectedIndex,
      onNavigationTapped: _onItemTapped,
    );
  }


}
