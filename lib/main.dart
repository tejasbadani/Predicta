import 'package:flutter/material.dart';
import 'package:predicta/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/Primary.dart';
void main() => runApp(MainPage());

class MainPage extends StatefulWidget{
    @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}
class _MainPageState extends State<MainPage>{

  SharedPreferences prefs;
    bool _isLoggedIn = false;
    void isSignedIn() async {
      
    prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('id');
    if (token != null){
      setState(() {
        _isLoggedIn = true;
      });
    }
    
  }

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Predicta',
      theme: ThemeData(
          primaryColor: Color.fromRGBO(58, 66, 86, 1.0),
          accentColor: Colors.white,
          buttonColor: Colors.white,
          canvasColor: Color.fromRGBO(58, 66, 86, 1.0),
          fontFamily: 'Rubik'),
      routes: {
        '/Page2': (BuildContext context) => Primary(),

      },
      // home: _isLoggedIn ? Primary(): Login(),
      home: Login()
    );

  }
}