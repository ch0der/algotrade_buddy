// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TimeSeriesDaily1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeSeriesDaily1 _$TimeSeriesDaily1FromJson(Map<String, dynamic> json) {
  return TimeSeriesDaily1()
    ..date = json['date'] == null
        ? null
        : Details.fromJson(json['date'] as Map<String, dynamic>);
}

Map<String, dynamic> _$TimeSeriesDaily1ToJson(TimeSeriesDaily1 instance) =>
    <String, dynamic>{'date': instance.date};
