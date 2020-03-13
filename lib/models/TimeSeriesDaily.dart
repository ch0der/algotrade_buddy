import 'package:json_annotation/json_annotation.dart';
import "time_series_data_meta_data.dart";
part 'TimeSeriesDaily.g.dart';

@JsonSerializable()
class TimeSeriesDaily2 {
    TimeSeriesDaily2();

    Time_series_data_meta_data MetaData;
    List TimeSeries;
    
    factory TimeSeriesDaily2.fromJson(Map<String,dynamic> json) => _$TimeSeriesDailyFromJson(json);
    Map<String, dynamic> toJson() => _$TimeSeriesDailyToJson(this);
}
