// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Details _$DetailsFromJson(Map<String, dynamic> json) {
  return Details()
    ..open = json['open'] as String
    ..high = json['high'] as String
    ..low = json['low'] as String
    ..close = json['close'] as String
    ..adjustedClose = json['adjustedClose'] as String
    ..volume = json['volume'] as String
    ..dividendAmount = json['dividendAmount'] as String
    ..splitCoefficient = json['splitCoefficient'] as String;
}

Map<String, dynamic> _$DetailsToJson(Details instance) => <String, dynamic>{
      'open': instance.open,
      'high': instance.high,
      'low': instance.low,
      'close': instance.close,
      'adjustedClose': instance.adjustedClose,
      'volume': instance.volume,
      'dividendAmount': instance.dividendAmount,
      'splitCoefficient': instance.splitCoefficient
    };
