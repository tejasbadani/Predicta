import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DS extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DSState();
  }
}

class _DSState extends State<DS> {
  final _bestCATextController = TextEditingController();
  final _secondBestTextController = TextEditingController();
  final _tutorial1TextController = TextEditingController();
  final _assignmentTextController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _didPressButton = false;
  int _finalResult = -1;
  Widget createBestCAScore() {
    return TextFormField( 
      controller: _bestCATextController,
      validator: (value) {
        double intVal = double.parse(value);
        if (value.length == 0) {
          return 'Enter a valid mark';
        }
        if (intVal < 0 || intVal > 25) {
          return 'Enter a valid mark';
        } else {
          return null;
        }
      },
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "Enter Best CA Mark (0-25)",
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

  Widget createSecondBestScore() {
    return TextFormField(
      controller: _secondBestTextController,
      validator: (value) {
        double intVal = double.parse(value);
        if (value.length == 0) {
          return 'Enter a valid mark';
        }
        if (intVal < 0 || intVal > 25) {
          return 'Enter a valid mark';
        } else {
          return null;
        }
      },
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "Enter Second Best CA Mark (0-25)",
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

  Widget createTutorial1() {
    return TextFormField(
      controller: _tutorial1TextController,
      validator: (value) {
        double intVal = double.parse(value);
        if (value.length == 0) {
          return 'Enter a valid mark';
        }
        if (intVal < 0 || intVal > 5) {
          return 'Enter a valid mark';
        } else {
          return null;
        }
      },
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "Enter Tutorial Mark (0-5)",
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

  Widget createAssignment() {
    return TextFormField(
      controller: _assignmentTextController,
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
        hintText: "Enter Assingment Presentation Mark (0-15)",
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
            var url = 'http://localhost:5000/predictDS';

            Map<String, String> headers = {"Content-type": "application/json"};
            var body = [
              {
                "ap": _assignmentTextController.text,
                "ca1": _bestCATextController.text,
                "ca2": _secondBestTextController.text,
                "tut": _tutorial1TextController.text
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
                'PREDICT DATA STRUCTURES MARKS',
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
                "ENTER BEST CA MARK 1 MARK",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w800),
              ),
            ),
            createBestCAScore(),
            SizedBox(height: 25),
            Container(
              padding: EdgeInsets.only(left: 10, bottom: 15),
              alignment: Alignment.centerLeft,
              child: Text(
                'ENTER SECOND BEST CA MARK',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w800),
              ),
            ),
            createSecondBestScore(),
            SizedBox(height: 25),
            Container(
              padding: EdgeInsets.only(left: 10, bottom: 15),
              alignment: Alignment.centerLeft,
              child: Text(
                'ENTER TUTORIAL MARK',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w800),
              ),
            ),
            createTutorial1(),
            SizedBox(height: 25),
            Container(
              padding: EdgeInsets.only(left: 10, bottom: 15),
              alignment: Alignment.centerLeft,
              child: Text(
                'ENTER ASSIGNMENT PRESENTATION MARK',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w800),
              ),
            ),
            createAssignment(),
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
