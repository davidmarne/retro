// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializers;

// **************************************************************************
// Generator: BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_returning_this
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(Board.serializer)
      ..add(Category.serializer)
      ..add(Item.serializer)
      ..add(Note.serializer)
      ..add(Session.serializer)
      ..add(User.serializer)
      ..addBuilderFactory(
          const FullType(
              BuiltMap, const [const FullType(String), const FullType(bool)]),
          () => new MapBuilder<String, bool>())
      ..addBuilderFactory(
          const FullType(
              BuiltMap, const [const FullType(String), const FullType(bool)]),
          () => new MapBuilder<String, bool>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(
              BuiltMap, const [const FullType(String), const FullType(String)]),
          () => new MapBuilder<String, String>())
      ..addBuilderFactory(
          const FullType(
              BuiltMap, const [const FullType(String), const FullType(int)]),
          () => new MapBuilder<String, int>())
      ..addBuilderFactory(
          const FullType(
              BuiltMap, const [const FullType(String), const FullType(int)]),
          () => new MapBuilder<String, int>()))
    .build();
