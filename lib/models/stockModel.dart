import 'dart:convert';

Map<String, Stock2> stockFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, Stock2>(k, Stock2.fromJson(v)));

String stockToJson(Map<String, Stock2> data) => json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class Stock2 {
  String the1Open;
  String the2High;
  String the3Low;
  String the4Close;
  String the5Volume;

  Stock2({
    this.the1Open,
    this.the2High,
    this.the3Low,
    this.the4Close,
    this.the5Volume,
  });

  factory Stock2.fromJson(Map<String, dynamic> json) => Stock2(
    the1Open: json["1. open"],
    the2High: json["2. high"],
    the3Low: json["3. low"],
    the4Close: json["4. close"],
    the5Volume: json["5. volume"],
  );

  Map<String, dynamic> toJson() => {
    "1. open": the1Open,
    "2. high": the2High,
    "3. low": the3Low,
    "4. close": the4Close,
    "5. volume": the5Volume,
  };
}
