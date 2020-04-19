import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ADS extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ADSState();
  }
}

class _ADSState extends State<ADS> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _didPressButton = false;
  bool _optIn = true;
  int _finalResult = -1;
  final _dsLabTextController = TextEditingController();
  final _dsTextController = TextEditingController();
  Widget createDSGradeField() {
    return TextFormField(
      controller: _dsTextController,
      validator: (String value) {
        double intVal = double.parse(value);
        if (value.length == 0) {
          return 'Enter a valid grade';
        }
        if (intVal < 5 || intVal > 10) {
          return 'Enter a valid grade';
        } else {
          return null;
        }
      },
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "Enter Grade (5-10)",
        hintStyle: TextStyle(color: Colors.white, fontSize: 13),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(width: 2, color: Colors.white),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(width: 2, color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(width: 2, color: Colors.white),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide(
              width: 2.5,
            )),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(width: 2, color: Colors.white),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(width: 2, color: Colors.white),
        ),
      ),
    );
  }

  Widget createDSLabField() {
    return TextFormField(
      controller: _dsLabTextController,
      validator: (value) {
        double intVal = double.parse(value);
        if (value.length == 0) {
          return 'Enter a valid grade';
        }
        if (intVal < 5 || intVal > 10) {
          return 'Enter a valid grade';
        } else {
          return null;
        }
      },
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "Enter Grade (5-10)",
        hintStyle: TextStyle(color: Colors.white, fontSize: 13),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(width: 2, color: Colors.white),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(width: 2, color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(width: 2, color: Colors.white),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide(
              width: 2.5,
            )),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(width: 2, color: Colors.white),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(width: 2, color: Colors.white),
        ),
      ),
    );
  }

  Widget createButtonDecide() {
    return ButtonTheme(
      minWidth: 115,
      height: 50,
      child: RaisedButton(
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(25),
            side: BorderSide(color: Colors.white)),
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            print("Executed");

            var url = 'http://localhost:5000/predictADS';
            print(_dsLabTextController.text);
            Map<String, String> headers = {"Content-type": "application/json"};
            var body = [
              {"ds": _dsTextController.text, "dslab": _dsLabTextController.text}
            ];
            String jsonString = json.encode(body);
            try {
              var response =
                  await http.post(url, headers: headers, body: jsonString);
              print('Response status: ${response.statusCode}');
              print('Response body: ${response.body}');
              if (response.statusCode == 200) {
                var result = json.decode(response.body);
                setState(() {
                  _didPressButton = true;
                });
                int resultInt = int.parse(result["prediction"]);
                _finalResult = resultInt;
                if (resultInt <= 6){
                  _optIn = false;
                }else{
                  _optIn = true;
                }
                print(resultInt);
                Future.delayed(const Duration(milliseconds: 3000), () {
                  setState(() {
                    _didPressButton = false;
                  });
                });
              }
            } catch (e) {
              print(e);
            }
          }
        },
        color: Colors.white,
        textColor: Colors.black,
        child: Text(
          "DECIDE".toUpperCase(),
          style: TextStyle(fontSize: 17),
        ),
      ),
    );
  }

  Widget showMessage() {
    return AnimatedOpacity(
        opacity: _didPressButton == true ? 1.0 : 0.0,
        duration: Duration(milliseconds: 500),
        child: Container(
          margin: EdgeInsets.only(top: 50),
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: _optIn == true ? Colors.green : Colors.red),
            height: 50,
            child: Text(
              _optIn == true
                  ? 'YES YOU SHOULD OPT IN'
                  : 'NOT ADVISABLE TO OPT IN',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Form(
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            alignment: Alignment.center,
            child: Text(
              'SHOULD YOU TAKE ELECTIVE ADS OR NOT?',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 50),
          Container(
            padding: EdgeInsets.only(left: 10, bottom: 15),
            alignment: Alignment.centerLeft,
            child: Text(
              "ENTER DS GRADE",
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w800),
            ),
          ),
          createDSGradeField(),
          SizedBox(height: 75),
          Container(
            padding: EdgeInsets.only(left: 10, bottom: 15),
            alignment: Alignment.centerLeft,
            child: Text(
              'ENTER DS LAB GRADE',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w800),
            ),
          ),
          createDSLabField(),
          SizedBox(height: 75),
          createButtonDecide(),
          showMessage()
        ]),
        key: _formKey,
      ),
    );
  }
}
