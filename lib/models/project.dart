import 'package:json_annotation/json_annotation.dart';

part 'project.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Project {
  const Project({
    required this.title,
    required this.description,
    required this.year,

    this.id,
    this.starredBy = const [],
  });

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  @JsonKey(includeToJson: false)
  final int? id;

  final String title;

  final String description;

  final String year;

  @JsonKey(defaultValue: <int>[])
  final List<int> starredBy;

  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}