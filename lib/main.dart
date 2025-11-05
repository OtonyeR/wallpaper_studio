import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:screen_retriever/screen_retriever.dart';
import 'package:wallpaper_studio/presentation/pages/home.dart';
import 'package:wallpaper_studio/presentation/pages/main_home.dart';
import 'package:wallpaper_studio/presentation/themes/app_theme.dart';
import 'package:wallpaper_studio/presentation/widgets/app_scaffold.dart';
import 'package:window_manager/window_manager.dart';

import 'data/models/category.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeData();

  await windowManager.ensureInitialized();

  Display primaryDisplay = await screenRetriever.getPrimaryDisplay();

  final double width = primaryDisplay.size.width;
  final double height = primaryDisplay.size.height;
  print(height);
  print(width);



  WindowOptions windowOptions = WindowOptions(
    minimumSize: Size(width * 0.28, height * 0.762),
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.widthOf(context);
    final height = MediaQuery.heightOf(context);
    final bool isNarrowScreen = width < 650;
    final bool isMediumScreen = width < 850;

    final Size currentDesignSize;
    if (isNarrowScreen) {
      // Small screen size (e.g., Mobile Portrait)
      currentDesignSize = const Size(440, 956);
    } else if (isMediumScreen) {
      // Medium screen size (e.g., Tablet or Mobile Landscape)
      currentDesignSize = const Size(1000, 1051);
    } else {
      // Wide screen size (e.g., Desktop)
      currentDesignSize = const Size(1440, 1051);
    }

    return ScreenUtilInit(
      // Apply the chosen design size
      designSize: currentDesignSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.theme,
          home: MainHome(),
        );
      },
    );
  }
}
