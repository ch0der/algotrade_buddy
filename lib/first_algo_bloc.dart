import 'dart:async';
import 'package:algotrade_buddy/models/index.dart';
import 'package:algotrade_buddy/models/stockModel.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'API_KEY.dart' show API_KEY;
import 'package:http/http.dart' as http;
import 'models/stockMode2.dart';

class FirstAlgoBloc{

  String basePath =  'https://www.alphavantage.co/query?';


  final _controller = StreamController.broadcast();
  final _subject = BehaviorSubject<Stock>();

  Stream<Stock> get subject => _subject.stream;

  Function(Stock) get addSubject => _subject.sink.add;

  dispose(){
    _controller.close();
    _subject.close();
  }

  FirstAlgoBloc(){
    firstCall();

  }

  Future<Stock> firstCall() async {
    String testQuery = 'function=TIME_SERIES_DAILY&symbol=MSFT&apikey=$API_KEY';

    final response = await http.get(basePath+testQuery);

    var info= json.decode(response.body);

    print(info["Time Series (Daily)"]);


    _subject.sink.add(Stock.fromJson(info));

    return Stock.fromJson(info);




  }


}