import 'dart:convert';

SimpleMovingAverage simpleMovingAverageFromJson(String str) => SimpleMovingAverage.fromJson(json.decode(str));

String simpleMovingAverageToJson(SimpleMovingAverage data) => json.encode(data.toJson());

class SimpleMovingAverage {
  MetaData metaData;
  Map<String, TechnicalAnalysisSma> technicalAnalysisSma;

  SimpleMovingAverage({
    this.metaData,
    this.technicalAnalysisSma,
  });

  factory SimpleMovingAverage.fromJson(Map<String, dynamic> json) => SimpleMovingAverage(
    metaData: MetaData.fromJson(json["Meta Data"]),
    technicalAnalysisSma: Map.from(json["Technical Analysis: SMA"]).map((k, v) => MapEntry<String, TechnicalAnalysisSma>(k, TechnicalAnalysisSma.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "Meta Data": metaData.toJson(),
    "Technical Analysis: SMA": Map.from(technicalAnalysisSma).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}

class MetaData {
  String the1Symbol;
  String the2Indicator;
  DateTime the3LastRefreshed;
  String the4Interval;
  int the5TimePeriod;
  String the6SeriesType;
  String the7TimeZone;

  MetaData({
    this.the1Symbol,
    this.the2Indicator,
    this.the3LastRefreshed,
    this.the4Interval,
    this.the5TimePeriod,
    this.the6SeriesType,
    this.the7TimeZone,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
    the1Symbol: json["1: Symbol"],
    the2Indicator: json["2: Indicator"],
    the3LastRefreshed: DateTime.parse(json["3: Last Refreshed"]),
    the4Interval: json["4: Interval"],
    the5TimePeriod: json["5: Time Period"],
    the6SeriesType: json["6: Series Type"],
    the7TimeZone: json["7: Time Zone"],
  );

  Map<String, dynamic> toJson() => {
    "1: Symbol": the1Symbol,
    "2: Indicator": the2Indicator,
    "3: Last Refreshed": the3LastRefreshed.toIso8601String(),
    "4: Interval": the4Interval,
    "5: Time Period": the5TimePeriod,
    "6: Series Type": the6SeriesType,
    "7: Time Zone": the7TimeZone,
  };
}

class TechnicalAnalysisSma {
  String sma;

  TechnicalAnalysisSma({
    this.sma,
  });

  factory TechnicalAnalysisSma.fromJson(Map<String, dynamic> json) => TechnicalAnalysisSma(
    sma: json["SMA"],
  );

  Map<String, dynamic> toJson() => {
    "SMA": sma,
  };
}