class AppString {
  static const String id = 'id';
  static const String name = 'name';
  
}


void printWrapped(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}