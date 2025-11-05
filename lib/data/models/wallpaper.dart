import 'package:wallpaper_studio/data/models/category.dart';

class Wallpaper {
  final String id;
  final Category category;
  final String assetPath;
  final String title;
  final List? tags;
  final String? colorHex;
  final String? description;

  const Wallpaper({
    required this.id,
    required this.category,
    required this.assetPath,
    required this.title,
    this.colorHex,
    this.tags,
    this.description,
  });
}
