// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      placeId: json['placeId'] as String,
      placeName: json['placeName'] as String,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'placeName': instance.placeName,
      'placeId': instance.placeId,
    };
