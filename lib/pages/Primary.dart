import 'package:flutter/material.dart';
import 'package:predicta/pages/PowerP.dart';
import 'package:predicta/pages/StudentP.dart';

class Primary extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PrimaryState();
  }
}

class _PrimaryState extends State<Primary> {
  int _currentIndex = 0;
  List<Widget> _children;
  Widget buildBottom() {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.assignment_ind,
            color: Colors.grey,
          ),
          activeIcon: Icon(
            Icons.assignment_ind,
            color: Colors.white,
          ),
          title: Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              "S-Prediction",
              style: TextStyle(
                  color: Colors.white, fontSize: 11),
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.lightbulb_outline, color: Colors.grey),
          activeIcon: Icon(
            Icons.lightbulb_outline,
            color: Colors.white,
          ),
          title: Container(
            margin: EdgeInsets.only(top: 10),
            child: Text("P-Prediction",
                style: TextStyle(
                    color: Colors.white,fontSize: 11)),
          ),
        ),
      ],
      currentIndex: _currentIndex,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
      type: BottomNavigationBarType.fixed,
    );
  }

  @override
  void initState() {
    _children = [StudentP(), PowerP()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text("Predicta"),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: buildBottom(),
    );
  }
}
