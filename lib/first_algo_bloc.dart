import 'dart:async';
import 'package:algotrade_buddy/models/index.dart';
import 'package:algotrade_buddy/models/stockModel.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'API_KEY.dart' show API_KEY;
import 'package:http/http.dart' as http;
import 'models/stockMode2.dart';
import 'models/SMA.dart';

class FirstAlgoBloc{

  String basePath =  'https://www.alphavantage.co/query?';


  final _controller = StreamController.broadcast();
  final _subject = BehaviorSubject<Stock>();
  Stream<Stock> get subject => _subject.stream;
  Function(Stock) get addSubject => _subject.sink.add;

  final _smaSubject = BehaviorSubject<SimpleMovingAverage>();
  Stream<SimpleMovingAverage> get sma => _smaSubject.stream;
  Function(SimpleMovingAverage) get addSMA => _smaSubject.sink.add;

  dispose(){
    _controller.close();
    _subject.close();
    _smaSubject.close();
  }

  FirstAlgoBloc(){
    firstCall();

  }

  Future<Stock> firstCall() async {
    String testQuery = 'function=TIME_SERIES_DAILY&symbol=MSFT&apikey=$API_KEY';

    final response = await http.get(basePath+testQuery);

    var info= json.decode(response.body);



    _subject.sink.add(Stock.fromJson(info));

    return Stock.fromJson(info);




  }
  Future<SimpleMovingAverage> callSMA(String function, String symbol, String interval, String timePeriod, String seriesType) async{
    String query = "https://www.alphavantage.co/query?function=$function&symbol=$symbol&interval=$interval&time_period=$timePeriod&series_type=$seriesType&apikey=U4YYPDBZMJWKZUL8";
    final res = await http.get(query);
    var info = json.decode(res.body);
    _smaSubject.sink.add(SimpleMovingAverage.fromJson(info));

    print(info);




  }



}