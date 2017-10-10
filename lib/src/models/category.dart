library category;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'category.g.dart';

const String CAT_COLOR_RED = "is-danger";
const String CAT_COLOR_BLUE = "is-info";
const String CAT_COLOR_YELLOW = "is-warning";
const String CAT_COLOR_GREEN = "is-success";
const String CAT_COLOR_DEFAULT = "is-dark";

const List<String> CAT_COLORS = const [CAT_COLOR_RED, CAT_COLOR_BLUE, CAT_COLOR_YELLOW, CAT_COLOR_GREEN, CAT_COLOR_DEFAULT];

String catColorDescription(String color) {
  switch(color) {
    case CAT_COLOR_RED:
    return "Red";
    case CAT_COLOR_BLUE:
    return "Blue";
    case CAT_COLOR_YELLOW:
    return "Yellow";
    case CAT_COLOR_GREEN:
    return "Green";
    default:
    return "Black";
  }
}

String textCss(String color) {
  switch(color) {
    case CAT_COLOR_RED:
    return "has-text-danger";
    case CAT_COLOR_BLUE:
    return "has-text-info";
    case CAT_COLOR_YELLOW:
    return "has-text-warning";
    case CAT_COLOR_GREEN:
    return "has-text-success";
    default:
    return "";
  }
}

/// [Category]
abstract class Category implements Built<Category, CategoryBuilder> {
  static Serializer<Category> get serializer => _$categorySerializer;

  /// [id] is the category's identifier
  String get uid;

  String get boardUid;

  String get sessionUid;

  String get title;

  String get description;

  @nullable
  String get color;

  /// [visible] when false, prevent Category from appearing in any sets.
  bool get visible;

  // Built value boilerplate
  Category._();
  factory Category([updates(CategoryBuilder b)]) = _$Category;

  @memoized
  colorClass() => color ?? CAT_COLOR_DEFAULT;
}
