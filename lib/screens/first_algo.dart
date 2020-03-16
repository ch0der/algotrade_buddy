import 'package:algotrade_buddy/first_algo_bloc.dart';
import 'package:algotrade_buddy/models/details.dart';
import 'package:flutter/material.dart';

import 'package:algotrade_buddy/models/stockMode2.dart';

class FirstAlgo extends StatefulWidget {
  @override
  _FirstAlgoState createState() => _FirstAlgoState();
}

class _FirstAlgoState extends State<FirstAlgo> {
  FirstAlgoBloc bloc = FirstAlgoBloc();

  String dropDownDuration = 'Daily';
  String dropDownStock = 'MSFT';
  String dropDownTimePeriod = '200';
  String dropDownSeriesType = 'Close';
  String dropDownIndicator = 'SMA';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.firstCall();
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
      ],
    );
  }

  screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  dropDownSize() {
    return screenSize(context).width*.25;
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
        "Daily",
        "Weekly",
        "Monthly"
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
            labelText: 'Interval',
          ),
          value: dropDownTimePeriod,
          items: [
            "50",
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
          items: ["MSFT", "AAPL", "NFLX", "SBUX"]
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

  dropDownItemsSeriesType() {
    return Container(
        width: dropDownSize(),
        child: DropdownButtonFormField(
          decoration: InputDecoration(
            labelText: 'Stock',
          ),
          value: dropDownSeriesType,
          items: ["Close", "Open", "High", "Low"]
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
            print(testList);
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
