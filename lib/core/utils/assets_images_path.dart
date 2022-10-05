const String imageAssetsRoot = "assets/images/";
const String iconAssetsRoot = "assets/icons/";

String tesImage = _getAssetsImagePath('test.jpg');
String test1Image = _getAssetsImagePath('test1.jpg');

String _getAssetsImagePath(String fileName) {
  return imageAssetsRoot + fileName;
}

String _getAssetsIconPath(String fileName) {
  return iconAssetsRoot + fileName;
}


