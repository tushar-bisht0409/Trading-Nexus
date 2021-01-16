import 'package:Nexus/main.dart';
import 'package:Nexus/screens/nexuscreen.dart';

import 'profilescreen.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                  height: queryData.size.height * 0.13,
                  child: TabBar(
                      labelColor: Colors.green[800],
                      unselectedLabelColor: Colors.green[300],
                      tabs: [
                        Tab(
                            icon: Icon(
                          Icons.account_circle,
                          size: 30,
                        )),
                        Tab(
                          icon: Icon(Icons.group, size: 30),
                        ),
                        Tab(
                          icon: Icon(Icons.notifications, size: 30),
                        )
                      ])),
              Container(
                  height: queryData.orientation == Orientation.portrait
                      ? queryData.size.height * 0.75
                      : queryData.size.height * 0.7,
                  child: TabBarView(children: <Widget>[
                    Card(child: ProfileScreen()),
                    Card(child: NexusScreen()),
                    Card(child: ListTile()),
                  ]))
            ]));
  }
}
