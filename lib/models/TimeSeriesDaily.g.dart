// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TimeSeriesDaily.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeSeriesDaily2 _$TimeSeriesDailyFromJson(Map<String, dynamic> json) {
  return TimeSeriesDaily2()
    ..MetaData = json['MetaData'] == null
        ? null
        : Time_series_data_meta_data.fromJson(
            json['MetaData'] as Map<String, dynamic>)
    ..TimeSeries = json['TimeSeries'] as List;
}

Map<String, dynamic> _$TimeSeriesDailyToJson(TimeSeriesDaily2 instance) =>
    <String, dynamic>{
      'MetaData': instance.MetaData,
      'TimeSeries': instance.TimeSeries
    };
