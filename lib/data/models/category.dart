import 'package:wallpaper_studio/data/models/wallpaper.dart';
import 'package:wallpaper_studio/data/wallpapers.dart';

class Category {
  final String id;
  final String title;
  final String imageUrl;
  final String desc;
  late List<Wallpaper> wallpapers;

  Category({
    required this.id,
    required this.title,
    required this.desc,
    required this.imageUrl,
    required this.wallpapers,
  });

  //
  // Future<List<Category>> loadCategoriesFromAsset() async {
  //   final raw = await rootBundle.loadString('lib/data/categories.json');
  //   final List<dynamic> list = json.decode(raw);
  //   return list.map((e) => Category.fromJson(e as Map<String, dynamic>)).toList();
  // }
}

final List<Category> categoriesList = [
  Category(
    id: '4',
    title: 'Nature',
    imageUrl: 'assets/wallpapers/nature/nature_bg.jpg',
    desc: 'Mountains, Forest and Landscapes',
    wallpapers: [],
  ),
  Category(
    id: '1',
    title: 'Abstract',
    imageUrl: 'assets/wallpapers/abstract/abstract_bg.jpg',
    desc: 'Modern Geometric and artistic designs',
    wallpapers: [],
  ),

  Category(
    id: '6',
    title: 'Urban',
    imageUrl: 'assets/wallpapers/urban/urban_bg.jpg',
    desc: 'Cities, architecture and street',
    wallpapers: [],
  ),
  Category(
    id: '5',
    title: 'Space',
    imageUrl: 'assets/wallpapers/space/space_bg.jpg',
    desc: 'Cosmos, planets, and galaxies',
    wallpapers: [],
  ),
  Category(
    id: '3',
    title: 'Minimalist',
    imageUrl: 'assets/wallpapers/minimalist/minimalist_bg.jpg',
    desc: 'Clean, simple, and elegant',
    wallpapers: [],
  ),
  Category(
    id: '2',
    title: 'Animals',
    imageUrl: 'assets/wallpapers/animals/animals_bg.jpg',
    desc: 'Wildlife and nature photography',
    wallpapers: [],
  ),
];

//


void initializeData() {
  for (var category in categoriesList) {
    final matchingWallpapers = wallpaperList
        .where((wallpaper) => wallpaper.category.title == category.title)
        .toList();

    category.wallpapers = matchingWallpapers;
  }
}
