import 'package:Nexus/widgets/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../providers/adduserdata.dart';
import 'package:provider/provider.dart';
import '../screens/searchscreen.dart';
import 'package:flutter/material.dart';
import './hometabs.dart';

class Home extends StatelessWidget {
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    print(FirebaseAuth.instance.currentUser.uid);
    Provider.of<UserData>(context, listen: false).setusid();
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
        drawer: NexusDrawer(),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Container(
              height: queryData.orientation == Orientation.portrait
                  ? queryData.size.height * 0.1
                  : queryData.size.height * 0.15,
              child: Card(
                  elevation: 0,
                  child: Row(children: <Widget>[
                    Builder(
                        builder: (context) => IconButton(
                              icon: Icon(Icons.menu),
                              onPressed: () {
                                Scaffold.of(context).openDrawer();
                              },
                            )),
                    Card(
                        elevation: 0,
                        color: Colors.grey[200],
                        child: Container(
                            width: queryData.size.width * 0.65,
                            child: Row(children: <Widget>[
                              FlatButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed(SearchScreen.routeName);
                                  },
                                  child: Row(children: <Widget>[
                                    Icon(Icons.search),
                                    Text('Search'),
                                    Padding(
                                        padding: EdgeInsets.only(
                                      right: queryData.size.width * 0.65 * 0.4,
                                    ))
                                  ]))
                            ]))),
                    Card(
                        elevation: 0,
                        child: IconButton(
                          icon: Icon(Icons.message),
                          onPressed: () {
                            //    ChatScreen();
                          },
                        ))
                  ]))),
          HomeTab()
        ])));
  }
}
