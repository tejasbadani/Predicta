import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class DSLab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DSLabState();
  }
}

class _DSLabState extends State<DSLab> {
  final _Ob1TextController = new TextEditingController();
  final _Ob2TextController = new TextEditingController();
  final _IR1TextController = new TextEditingController();
  final _IR2TextController = new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int _finalResult = -1;
  bool _didPressButton = false;
  Widget createOb1Field() {
    return TextFormField(
      controller: _Ob1TextController,
      validator: (value) {
        double intVal = double.parse(value);
        if (value.length == 0) {
          return 'Enter a valid mark';
        }
        if (intVal < 0 || intVal > 10) {
          return 'Enter a valid mark';
        } else {
          return null;
        }
      },
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "Enter Observation 1 Mark (0-10)",
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

  Widget createOb2Field() {
    return TextFormField(
      controller: _Ob2TextController,
      validator: (value) {
        double intVal = double.parse(value);
        if (value.length == 0) {
          return 'Enter a valid mark';
        }
        if (intVal < 0 || intVal > 10) {
          return 'Enter a valid mark';
        } else {
          return null;
        }
      },
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "Enter Observation 2 mark (0-10)",
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

  Widget createIR1Field() {
    return TextFormField(
      controller: _IR1TextController,
      validator: (value) {
        double intVal = double.parse(value);
        if (value.length == 0) {
          return 'Enter a valid mark';
        }
        if (intVal < 0 || intVal > 15) {
          return 'Enter a valid mark';
        } else {
          return null;
        }
      },
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "Enter Report 1 Mark (0-15)",
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

  Widget createIR2Field() {
    return TextFormField(
      controller: _IR2TextController,
      validator: (value) {
        double intVal = double.parse(value);
        if (value.length == 0) {
          return 'Enter a valid mark';
        }
        if (intVal < 0 || intVal > 15) {
          return 'Enter a valid mark';
        } else {
          return null;
        }
      },
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "Enter Report 2 Mark (0-15)",
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

  Widget showMessage() {
    return AnimatedOpacity(
        opacity: _didPressButton == true ? 1.0 : 0.0,
        duration: Duration(milliseconds: 500),
        child: Container(
          margin: EdgeInsets.only(top: 20),
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.grey),
            height: 50,
            child: Text(
              "Your Predicted Grade is $_finalResult",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ));
  }

  Widget createButton() {
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
            var url = 'http://localhost:5000/predictDSLab';

            Map<String, String> headers = {"Content-type": "application/json"};
            var body = [
              {
                "ob1": _Ob1TextController.text,
                "ob2": _Ob2TextController.text,
                "rp1": _IR1TextController.text,
                "rp2": _IR2TextController.text
              }
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
          "PREDICT".toUpperCase(),
          style: TextStyle(fontSize: 17),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(15),
        child: Form(
          child: Column(children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              child: Text(
                'PREDICT DATA STRUCTURES LAB MARKS',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(left: 10, bottom: 15),
              alignment: Alignment.centerLeft,
              child: Text(
                "ENTER OBSERVATION 1 MARK",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w800),
              ),
            ),
            createOb1Field(),
            SizedBox(height: 25),
            Container(
              padding: EdgeInsets.only(left: 10, bottom: 15),
              alignment: Alignment.centerLeft,
              child: Text(
                'ENTER OBSERVATION 2 MARK',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w800),
              ),
            ),
            createOb2Field(),
            SizedBox(height: 25),
            Container(
              padding: EdgeInsets.only(left: 10, bottom: 15),
              alignment: Alignment.centerLeft,
              child: Text(
                'ENTER REPORT 1 MARK',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w800),
              ),
            ),
            createIR1Field(),
            SizedBox(height: 25),
            Container(
              padding: EdgeInsets.only(left: 10, bottom: 15),
              alignment: Alignment.centerLeft,
              child: Text(
                'ENTER REPORT 2 MARK',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w800),
              ),
            ),
            createIR2Field(),
            SizedBox(height: 15),
            createButton(),
            showMessage()
          ]),
          key: _formKey,
        ),
      ),
    );
  }
}
