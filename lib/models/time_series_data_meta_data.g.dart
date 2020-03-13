// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_series_data_meta_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Time_series_data_meta_data _$Time_series_data_meta_dataFromJson(
    Map<String, dynamic> json) {
  return Time_series_data_meta_data()
    ..information = json['information'] as String
    ..symbol = json['symbol'] as String
    ..refreshed = json['refreshed'] as String
    ..output = json['output'] as String
    ..timeZone = json['timeZone'] as String;
}

Map<String, dynamic> _$Time_series_data_meta_dataToJson(
        Time_series_data_meta_data instance) =>
    <String, dynamic>{
      'information': instance.information,
      'symbol': instance.symbol,
      'refreshed': instance.refreshed,
      'output': instance.output,
      'timeZone': instance.timeZone
    };
