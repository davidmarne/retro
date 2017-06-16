library category;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'category.g.dart';

/// [Category]
abstract class Category implements Built<Category, CategoryBuilder> {
  static Serializer<Category> get serializer => _$categorySerializer;

  /// [id] is the category's identifier
  String get uid;

  /// [text] is the category's text
  String get title;

  String get color;

  int get order;

  // Built value boilerplate
  Category._();
  factory Category([updates(CategoryBuilder b)]) = _$Category;
}
