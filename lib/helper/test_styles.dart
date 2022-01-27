import 'package:flutter/widgets.dart';

class TextStyles {
  static const TextStyle _defaultTextStyle = TextStyle();
  static const TextStyle titleTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle regularTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle listTitleTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle listSubTitleTextStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle listMidTitleTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle listSmallTitleTextStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
  );

  static const TextStyle mediumUnderLineTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
  );
}
