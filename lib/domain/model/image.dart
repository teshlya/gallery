import 'package:meta/meta.dart';

class Day {
  final String smallImage;
  final String fullImage;
  final String author;
  final String   title;

  Day({
    @required this.smallImage,
    @required this.fullImage,
    @required this.author,
    @required this.title,
  });
}