import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:core';

class PowerP extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PowerPState();
  }
}

class _PowerPState extends State<PowerP> {
  String _category = "First Quarter";
  int _intValue = 91;
  int _indexVal = 1;
  double minVal = 9999999;
  double maxVal = 0;
  double avgVal = 0;
  bool animate = false;
  bool _didPressButton = false;
  List<dynamic> listOfValues = [];
  @override
  void initState() {
    super.initState();
  }

  Widget createFirstDropDown() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(20),
      child: DropdownButton(
        focusColor: Colors.white,
        hint: Text(
          "Choose Category",
          style: TextStyle(color: Colors.white),
        ),
        isExpanded: true,
        value: _category,
        style: TextStyle(color: Colors.white),
        items: <String>[
          'First Quarter',
          'Second Quarter',
          'Third Quarter',
          'Fourth Quarter',
          'Fifth Quarter',
          'Sixth Quarter',
          'Seventh Quarter',
          'Eighth Quarter'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              //style: TextStyle(color: Colors.black),
            ),
          );
        }).toList(),
        onChanged: (val) {
          if (val == 'First Quarter') {
            _intValue = 91;
            _indexVal = 1;
          } else if (val == 'Second Quarter') {
            _intValue = 182;
            _indexVal = 2;
          } else if (val == 'Third Quarter') {
            _intValue = 274;
            _indexVal = 3;
          } else if (val == 'Fourth Quarter') {
            _intValue = 366;
            _indexVal = 4;
          } else if (val == 'Fifth Quarter') {
            _intValue = 456;
            _indexVal = 5;
          } else if (val == 'Sixth Quarter') {
            _intValue = 547;
            _indexVal = 6;
          } else if (val == 'Seventh Quarter') {
            _intValue = 639;
            _indexVal = 7;
          } else {
            _intValue = 731;
            _indexVal = 8;
          }
          setState(() {
            _category = val;
          });
        },
      ),
    );
  }

  Widget createButton() {
    return ButtonTheme(
      minWidth: 115,
      height: 40,
      child: RaisedButton(
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(25),
            side: BorderSide(color: Colors.white)),
        onPressed: () async {
          var url = 'http://localhost:5000/predictPower';

          Map<String, String> headers = {"Content-type": "application/json"};
          var body = [
            {"one": 2223, "two": 2223 + _intValue, "three": _intValue}
          ];
          String jsonString = json.encode(body);
          try {
            var response =
                await http.post(url, headers: headers, body: jsonString);
            print('Response status: ${response.statusCode}');
            if (response.statusCode == 200) {
              var result = json.decode(response.body);
              setState(() {
                _didPressButton = true;
              });
              listOfValues = result["prediction"];
            }
          } catch (e) {
            print(e);
          }
        },
        color: Colors.white,
        textColor: Colors.black,
        child: Text(
          "SHOW FORECAST".toUpperCase(),
          style: TextStyle(fontSize: 17),
        ),
      ),
    );
  }

  Widget createChart() {
    return Container(
      child: SfCartesianChart(
        series: getDefaultDateTimeSeries(),
        primaryXAxis: DateTimeAxis(
            intervalType: DateTimeIntervalType.days,
            //dateFormat: DateFormat.QQQ(),
            interval: 30,
            labelFormat: ' '),
      ),
    );
  }

  List<LineSeries<TimeSeries, DateTime>> getDefaultDateTimeSeries() {
    List<TimeSeries> data = [];
    double sum = 0;
    listOfValues.asMap().forEach((f, val) {
      sum = sum + val;
      if (val>maxVal){
        maxVal = val;
      }
      if (val < minVal){
        minVal = val;
      }
      data.add(TimeSeries(day: DateTime(2020, 1, f + 1), consumption: val));
    });
    avgVal = sum/listOfValues.length;
    return <LineSeries<TimeSeries, DateTime>>[
      LineSeries<TimeSeries, DateTime>(
        dataSource: data,
        xValueMapper: (TimeSeries data, _) => data.day,
        yValueMapper: (TimeSeries data, _) => data.consumption,
        color: const Color.fromRGBO(242, 117, 7, 1),
      )
    ];
  }

  Widget createPeakConsumption() {
    var peakConsumption = maxVal.round();
    return Container(
      child: Text(
        'Peak Consumption : $peakConsumption Units',
        style: TextStyle(color: Colors.white, fontSize: 17),
      ),
    );
  }
   Widget createAverageConsumption() {
    var avgConsumption = avgVal.round();
    return Container(
      child: Text(
        'Average Consumption : $avgConsumption Units',
        style: TextStyle(color: Colors.white, fontSize: 17),
      ),
    );
  }
     Widget minConsumption() {
    var minConsumption = minVal.round();
    return Container(
      child: Text(
        'Minimum Consumption : $minConsumption Units',
        style: TextStyle(color: Colors.white, fontSize: 17),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Predict Power Consumption'),
      ),
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      body: Container(
        child: Column(
          children: <Widget>[
            createFirstDropDown(),
            SizedBox(
              height: 20,
            ),
            _didPressButton == true ? createChart() : Container(),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: createButton(),
            ),
            SizedBox(
              height: 20,
            ),
            _didPressButton == true ? createAverageConsumption() : Container(),
            SizedBox(
              height: 10,
            ),
            _didPressButton == true ? createPeakConsumption() : Container(),
            SizedBox(
              height: 10,
            ),
            _didPressButton == true ? minConsumption() : Container(),
          ],
        ),
      ),
    );
  }
}

class TimeSeries {
  final DateTime day;
  final double consumption;
  TimeSeries({this.day, this.consumption});
}
