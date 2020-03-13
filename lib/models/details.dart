import 'package:json_annotation/json_annotation.dart';

part 'details.g.dart';

@JsonSerializable()
class Details {
    Details();

    String open;
    String high;
    String low;
    String close;
    String adjustedClose;
    String volume;
    String dividendAmount;
    String splitCoefficient;
    
    factory Details.fromJson(Map<String,dynamic> json) => _$DetailsFromJson(json);
    Map<String, dynamic> toJson() => _$DetailsToJson(this);
}
