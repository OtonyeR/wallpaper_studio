import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallpaper_studio/data/models/wallpaper.dart';

class WallpaperPrefs {
  /// Id of the currently selected wallpaper.
  static Future<bool> setCurrentWallpaper(String id) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(PrefKeys.currentWallpaper, id);
  }

  /// Retrieves the id of the currently selected wallpaper.
  static Future<String> getCurrentWallpaper() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(PrefKeys.currentWallpaper) ?? '';
  }

  /// Saves the entire list of favorite wallpaper id.
  static Future<bool> setSavedWallpapers(List<String> wallpapers) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setStringList(PrefKeys.savedWallpapers, wallpapers);
  }

  /// Retrieves the list of favorite wallpaper id.
  static Future<List<String>> getSavedWallpapers() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(PrefKeys.savedWallpapers) ?? [];
  }

  /// Toggles a wallpaper path's presence in the saved list.
  /// Returns true if the state was successfully updated.
  static Future<bool> toggleSavedWallpaper(String id) async {
    List<String> currentList = await getSavedWallpapers();

    if (currentList.contains(id)) {
      // Remove it (Unsave)
      currentList.remove(id);
    } else {
      // Add it (Save)
      currentList.add(id);
    }
    return setSavedWallpapers(currentList);
  }

  /// Checks if a wallpaper path is currently in the saved list.
  static Future<bool> isWallpaperSaved(String id) async {
    final List<String> savedList = await getSavedWallpapers();
    return savedList.contains(id);
  }

  // --- Convenience Methods using Wallpaper Model ---

  /// Retrieves the favorite status using the Wallpaper object's ID.
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
