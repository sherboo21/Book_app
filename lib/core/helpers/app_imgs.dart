import 'extentions.dart';

class AssetPaths {
  static String _getPath(String folder, String file, String extension) {
    return 'assets/$folder/$file$extension';
  }

  static String jsonFile(String file) => _getPath('animations', file, '.json');
}

class AppAnimations {
  static String noInternetConnectionAnimation = 'noInternetConnection'.jsonFile;
}
