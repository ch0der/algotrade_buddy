import 'package:algotrade_buddy/first_algo_bloc.dart';
import 'package:algotrade_buddy/models/details.dart';
import 'package:flutter/material.dart';
import 'package:algotrade_buddy/models/TimeSeriesDaily.dart';
import 'package:algotrade_buddy/models/TimeSeriesDaily1.dart';
import 'package:algotrade_buddy/models/stockMode2.dart';

class FirstAlgoScreen extends StatefulWidget {
  @override
  _FirstAlgoScreenState createState() => _FirstAlgoScreenState();
}

class _FirstAlgoScreenState extends State<FirstAlgoScreen> {
  FirstAlgoBloc bloc = FirstAlgoBloc();

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


                  return ListTile(
                    title: Text("${testList[index].the2High}"),

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
