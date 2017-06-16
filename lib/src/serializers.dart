library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/standard_json_plugin.dart';

import './models/user.dart';
import './models/board.dart';
import './models/session.dart';
import './models/category.dart';
import './models/item.dart';
import './models/note.dart';

part 'serializers.g.dart';

/// Collection of generated serializers for the built_json chat example.
Serializers serializers = (_$serializers.toBuilder()..addPlugin(new StandardJsonPlugin())).build();
