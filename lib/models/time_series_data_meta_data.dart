import 'package:json_annotation/json_annotation.dart';

part 'time_series_data_meta_data.g.dart';

@JsonSerializable()
class Time_series_data_meta_data {
    Time_series_data_meta_data();

    String information;
    String symbol;
    String refreshed;
    String output;
    String timeZone;
    
    factory Time_series_data_meta_data.fromJson(Map<String,dynamic> json) => _$Time_series_data_meta_dataFromJson(json);
    Map<String, dynamic> toJson() => _$Time_series_data_meta_dataToJson(this);
}
