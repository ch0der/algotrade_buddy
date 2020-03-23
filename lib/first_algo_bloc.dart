import 'dart:async';
import 'package:algotrade_buddy/models/index.dart';
import 'package:algotrade_buddy/models/stockModel.dart';
import 'package:algotrade_buddy/models/stock_intra_day.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'API_KEY.dart' show API_KEY;
import 'package:http/http.dart' as http;
import 'models/stockModel2.dart';
import 'models/SMA.dart';

class FirstAlgoBloc{

  String basePath =  'https://www.alphavantage.co/query?';


  final _controller = StreamController.broadcast();
  final _subject = BehaviorSubject<Stock>();
  Stream<Stock> get subject => _subject.stream;
  Function(Stock) get addSubject => _subject.sink.add;

  final _smaSubject = BehaviorSubject<List<SMASimple>>();
  Stream<List<SMASimple>> get sma => _smaSubject.stream;
  Function(List<SMASimple>) get addSMA => _smaSubject.sink.add;

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
    String query = "https://www.alphavantage.co/query?function=$function&symbol=$symbol&interval=$interval&time_period=$timePeriod&outputsize=compact&series_type=$seriesType&apikey=U4YYPDBZMJWKZUL8";
    final res = await http.get(query);
    var info = json.decode(res.body);

    Map values = SimpleMovingAverage.fromJson(info).technicalAnalysisSma;
    List dates = values.keys.toList();
    List<TechnicalAnalysisSma> testList = values.values.toList();

    final List<SMASimple> items = List<SMASimple>.generate(values.length,(i)=> SMASimple(dates[i],double.parse(double.parse(testList[i].sma).toStringAsFixed(2)),-i));


    _smaSubject.sink.add(items);





  }

  Future<IntraDay> callIntraDat() async{

  }





}
class SMASimple{
  final int count;
  final String date;
  final double price;

  SMASimple(this.date, this.price,this.count);


}
class IntraDayS{
  final int count;
  final String time;
  final double price;

  IntraDayS(this.count, this.time, this.price);


}