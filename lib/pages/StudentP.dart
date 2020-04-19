import 'package:flutter/material.dart';
import 'package:predicta/pages/ADS.dart';
import 'package:predicta/pages/DS.dart';
import 'package:predicta/pages/DSLab.dart';

class StudentP extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StudentPState();
  }
}

class _StudentPState extends State<StudentP>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 50),
          child: AppBar(
            bottom: TabBar(
              labelColor: Colors.white,
              tabs: [
                // Container(
                //   child: Text("DS"),
                //   margin: EdgeInsets.only(bottom: 5,top: 5),
                // ),
                Container(
                  child: Text("ADS"),
                  margin: EdgeInsets.only(bottom: 5,top: 5),
                ),
                Container(
                  child: Text("DS Lab"),
                  margin: EdgeInsets.only(bottom: 5,top: 5),
                ),
                Container(
                  child: Text("DS"),
                  margin: EdgeInsets.only(bottom: 5,top: 5),
                )
                
              ],
              controller: _tabController,
            ),
          ),
        ),
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        body: TabBarView(
          children: [
            //DS(),
            ADS(),
            DSLab(),
            DS()
          ],
          controller: _tabController,
        ));
  }
}
