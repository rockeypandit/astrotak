import 'package:json_annotation/json_annotation.dart';
part 'Location.g.dart';

@JsonSerializable()
class Location {
  final String placeName;
  final String placeId;
  Location({required this.placeId, required this.placeName});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
