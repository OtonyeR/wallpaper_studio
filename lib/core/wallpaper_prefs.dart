import 'package:shared_preferences/shared_preferences.dart';

import '../data/models/wallpaper.dart';

class WallpaperPrefs {
  static Future<bool> setCurrentWallpaper(String id) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(PrefKeys.currentWallpaper, id);
  }

  static Future<String> getCurrentWallpaper() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(PrefKeys.currentWallpaper) ?? '';
  }

  static Future<bool> setSavedWallpapers(List<String> wallpapers) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setStringList(PrefKeys.savedWallpapers, wallpapers);
  }

  static Future<List<String>> getSavedWallpapers() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(PrefKeys.savedWallpapers) ?? [];
  }


  static Future<bool> toggleSavedWallpaper(String id) async {
    List<String> currentList = await getSavedWallpapers();

    if (currentList.contains(id)) {
      currentList.remove(id);
    } else {
      currentList.add(id);
    }
    return setSavedWallpapers(currentList);
  }

  static Future<bool> isWallpaperSaved(String id) async {
    final List<String> savedList = await getSavedWallpapers();
    return savedList.contains(id);
  }

  static Future<bool> isWallpaperSavedFromModel(Wallpaper wallpaper) async {
    return isWallpaperSaved(
      wallpaper.id,
    ); // Assuming you use the unique 'id' as the path/identifier
  }

  /// Toggles favorite status using the Wallpaper object's ID.
  /// Returns true if the state was successfully updated.
  static Future<bool> toggleSavedWallpaperFromModel(Wallpaper wallpaper) async {
    return toggleSavedWallpaper(
      wallpaper.id,
    ); // Assuming you use the unique 'id' as the path/identifier
  }
}

class PrefKeys {
  static const String currentWallpaper = 'currentWallpaperPath';
  static const String savedWallpapers = 'savedWallpapersList';
}
