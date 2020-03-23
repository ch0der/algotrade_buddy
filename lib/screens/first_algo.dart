import 'package:algotrade_buddy/first_algo_bloc.dart';
import 'package:algotrade_buddy/models/details.dart';
import 'package:algotrade_buddy/models/stock_intra_day.dart';
import 'package:flutter/material.dart';

import 'package:algotrade_buddy/models/stockModel2.dart';
import 'package:algotrade_buddy/models/SMA.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math' as math;

class FirstAlgo extends StatefulWidget {
  @override
  _FirstAlgoState createState() => _FirstAlgoState();
}

class _FirstAlgoState extends State<FirstAlgo> {
  FirstAlgoBloc bloc = FirstAlgoBloc();

  String dropDownDuration = 'daily';
  String dropDownStock = 'TQQQ';
  String dropDownTimePeriod = '5';
  String dropDownSeriesType = 'close';
  String dropDownIndicator = 'SMA';
  List<SMASimple> itemsTest = [
    SMASimple('1', 5, 1),
    SMASimple('2', 1, 2),
    SMASimple('3', 3, 3)
  ];
  int indexTest = 3;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  buildBody() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            dropDownItemsIndicator(),
            dropDownItemsDuration(),
            dropDownItemsSeriesType(),
            dropDownItemsStocks(),
          ],
        ),
        dropDownItemsTimePeriod(),
        submitTest(),
        smaList(),
        StreamBuilder<Object>(
            stream: bloc.sma,
            builder: (context, snapshot) {
              return Container(
                height: 300,
                child: charts.LineChart(
                  _createSampleData(snapshot.hasData ? snapshot.data : itemsTest,snapshot.hasData ? snapshot.data : itemsTest ),
                  animate: false,
                  defaultInteractions: true,
                ),
              );
            }),
      ],
    );
  }

  smaList() {
    return Container(
      height: 200,
      width: 200,
      child: StreamBuilder<List<SMASimple>>(
          stream: bloc.sma,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List items = snapshot.data;
              itemsTest = items.sublist(0, 100);

              return Container(
                child: ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${items[index].price}'),
                      subtitle: Text(items[index].date),
                    );
                  },
                ),
              );
            } else {
              return Container(
                child: Text('..waiting'),
              );
            }
          }),
    );
  }

  submitTest() {
    return Container(
      height: 20,
      width: 40,
      child: RaisedButton(onPressed: () {
        bloc.callSMA(dropDownIndicator, dropDownStock, dropDownDuration,
            dropDownTimePeriod, dropDownSeriesType);
      }),
    );
  }

  screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  dropDownSize() {
    return screenSize(context).width * .25;
  }

  dropDownItemsDuration() {
    return SizedBox(
        width: dropDownSize(),
        child: DropdownButtonFormField(
          decoration: InputDecoration(
            labelText: 'Interval',
          ),
          value: dropDownDuration,
          items: [
            "1min",
            "5min",
            "15min",
            "30min",
            "60min",
            "daily",
            "weekly",
            "monthly"
          ]
              .map((String value) => DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  ))
              .toList(),
          onChanged: (String newValue) {
            setState(() {
              dropDownDuration = newValue;
            });
          },
        ));
  }

  dropDownItemsTimePeriod() {
    return Container(
        width: dropDownSize(),
        child: DropdownButtonFormField(
          decoration: InputDecoration(
            labelText: 'Time Period',
          ),
          value: dropDownTimePeriod,
          items: [
            "5",
            "100",
            "200",
            "500",
          ]
              .map((String value) => DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  ))
              .toList(),
          onChanged: (String newValue) {
            setState(() {
              dropDownTimePeriod = newValue;
            });
          },
        ));
  }

  dropDownItemsStocks() {
    return Container(
        width: dropDownSize(),
        child: DropdownButtonFormField(
          decoration: InputDecoration(
            labelText: 'Stock',
          ),
          value: dropDownStock,
          items: ["TQQQ", "AAPL", "NFLX", "SBUX"]
              .map((String value) => DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  ))
              .toList(),
          onChanged: (String newValue) {
            setState(() {
              dropDownStock = newValue;
            });
          },
        ));
  }

  static List<charts.Series<dynamic, int>> _createSampleData(
      List<SMASimple> _list,List<IntraDayS>_list2) {
    final data = [
      SMASimple('43', 343, 1),
      SMASimple('47', 343, 2),
    ];

    return [
      new charts.Series<SMASimple, int>(
          id: 'Sales',
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          domainFn: (SMASimple movement, _) => movement.count,
          measureFn: (SMASimple price, _) => price.price,
          data: _list),
      charts.Series<IntraDayS,int>(
        id: 'Price',
        domainFn: (IntraDayS movement,_) => movement.count,
        measureFn: (IntraDayS price,_) => price.price,
        data: _list2
      ),
    ];
  }

  dropDownItemsSeriesType() {
    return Container(
        width: dropDownSize(),
        child: DropdownButtonFormField(
          decoration: InputDecoration(
            labelText: 'Stock',
          ),
          value: dropDownSeriesType,
          items: ["close", "Open", "High", "Low"]
              .map((String value) => DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  ))
              .toList(),
          onChanged: (String newValue) {
            setState(() {
              dropDownSeriesType = newValue;
            });
          },
        ));
  }

  dropDownItemsIndicator() {
    return Container(
        width: dropDownSize(),
        child: DropdownButtonFormField(
          decoration: InputDecoration(
            labelText: 'Stock',
          ),
          value: dropDownIndicator,
          items: ["SMA"]
              .map((String value) => DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  ))
              .toList(),
          onChanged: (String newValue) {
            setState(() {
              dropDownIndicator = newValue;
            });
          },
        ));
  }

  buildList() {
    return Container(
      child: StreamBuilder<Stock>(
        stream: bloc.subject,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Map values = snapshot.data.timeSeriesDaily;
            List<TimeSeriesDaily> testList = values.values.toList();
            return Container(
              child: ListView.builder(
                itemCount: values.length,
                itemBuilder: (context, index) {
                  String str = testList[index].the2High;
                  var price = double.parse(str).toStringAsFixed(2);
                  double _price = double.parse(price);

                  return ListTile(
                    title: Text("\$$_price"),
                  );
                },
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class TestTimeSeriesChart extends StatefulWidget {
  final List list;
  final bool animate;

  TestTimeSeriesChart(this.list, this.animate);

  @override
  _TestTimeSeriesChartState createState() => _TestTimeSeriesChartState();
}

class _TestTimeSeriesChartState extends State<TestTimeSeriesChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: charts.LineChart(widget.list, animate: widget.animate),
    );
  }
}

class TimeChart extends StatelessWidget {
  final List list;
  final bool animate;

  TimeChart(this.list, {this.animate});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: charts.LineChart(
        list,
        animate: animate,
      ),
    );
  }
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
