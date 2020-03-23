import 'dart:convert';

IntraDay intraDayFromJson(String str) => IntraDay.fromJson(json.decode(str));

String intraDayToJson(IntraDay data) => json.encode(data.toJson());

class IntraDay {
  MetaData metaData;
  Map<String, TimeSeriesMin> timeSeriesMin;

  IntraDay({
    this.metaData,
    this.timeSeriesMin,
  });

  factory IntraDay.fromJson(Map<String, dynamic> json) => IntraDay(
    metaData: MetaData.fromJson(json["Meta Data"]),
    timeSeriesMin: Map.from(json["Time Series (5min)"]).map((k, v) => MapEntry<String, TimeSeriesMin>(k, TimeSeriesMin.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "Meta Data": metaData.toJson(),
    "Time Series (5min)": Map.from(timeSeriesMin).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}

class MetaData {
  String the1Information;
  String the2Symbol;
  DateTime the3LastRefreshed;
  String the4Interval;
  String the5OutputSize;
  String the6TimeZone;

  MetaData({
    this.the1Information,
    this.the2Symbol,
    this.the3LastRefreshed,
    this.the4Interval,
    this.the5OutputSize,
    this.the6TimeZone,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
    the1Information: json["1. Information"],
    the2Symbol: json["2. Symbol"],
    the3LastRefreshed: DateTime.parse(json["3. Last Refreshed"]),
    the4Interval: json["4. Interval"],
    the5OutputSize: json["5. Output Size"],
    the6TimeZone: json["6. Time Zone"],
  );

  Map<String, dynamic> toJson() => {
    "1. Information": the1Information,
    "2. Symbol": the2Symbol,
    "3. Last Refreshed": the3LastRefreshed.toIso8601String(),
    "4. Interval": the4Interval,
    "5. Output Size": the5OutputSize,
    "6. Time Zone": the6TimeZone,
  };
}

class TimeSeriesMin {
  String the1Open;
  String the2High;
  String the3Low;
  String the4Close;
  String the5Volume;

  TimeSeriesMin({
    this.the1Open,
    this.the2High,
    this.the3Low,
    this.the4Close,
    this.the5Volume,
  });

  factory TimeSeriesMin.fromJson(Map<String, dynamic> json) => TimeSeriesMin(
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