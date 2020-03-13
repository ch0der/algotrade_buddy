import 'package:json_annotation/json_annotation.dart';
import "details.dart";
part 'TimeSeriesDaily1.g.dart';

@JsonSerializable()
class TimeSeriesDaily1 {
    TimeSeriesDaily1();

    Details date;
    
    factory TimeSeriesDaily1.fromJson(Map<String,dynamic> json) => _$TimeSeriesDaily1FromJson(json);
    Map<String, dynamic> toJson() => _$TimeSeriesDaily1ToJson(this);
}
