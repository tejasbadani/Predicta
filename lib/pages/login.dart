import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget createRollField() {
    return TextFormField(
      validator: (value) {
        if (value.length < 4) {
          return 'Enter a valid ID';
        }
      },
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "Roll Number/ Employee ID",
        hintStyle: TextStyle(color: Colors.white),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(width: 2.5, color: Colors.white),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(width: 2.5, color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(width: 2.5, color: Colors.white),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide(
              width: 2.5,
            )),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(width: 2.5, color: Colors.white),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(width: 2.5, color: Colors.white),
        ),
      ),
    );
  }

  Widget createPasswordField() {
    return TextFormField(
      validator: (value) {
        print("2");
        if (value.length < 5) {
          return 'Invalid Size of Password';
        }
      },
      obscureText: true,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: TextStyle(color: Colors.white),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(width: 2.5, color: Colors.white),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(width: 2.5, color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(width: 2.5, color: Colors.white),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide(
              width: 2.5,
            )),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(width: 2.5, color: Colors.white),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(width: 2.5, color: Colors.white),
        ),
      ),
    );
  }

  Widget createButtonLogin() {
    return ButtonTheme(
      minWidth: 115,
      height: 50,
      child: RaisedButton(
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(25),
            side: BorderSide(color: Colors.white)),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            print("Executed");
            Navigator.pushReplacementNamed(context, '/Page2');
          }
        },
        color: Colors.white,
        textColor: Colors.black,
        child: Text("LOG IN".toUpperCase(), style: TextStyle(fontSize: 20)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Center(
                child: Image.asset('assets/asset_1.png'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Center(
                child: Text(
                  'PREDICTA',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 60, left: 15, right: 15),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    createRollField(),
                    Container(margin: EdgeInsets.all(20)),
                    createPasswordField(),
                    Container(margin: EdgeInsets.all(40)),
                    createButtonLogin()
                  ],
                ),
              ),
            ),
            // _isLoading == true ? CustomLoading() : Container(),
          ]),
    );
  }
}
