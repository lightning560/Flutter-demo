import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

enum FeedKind {
  @JsonValue('image')
  image,
  @JsonValue('video')
  video,
  @JsonValue('live')
  live
}
