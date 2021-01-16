import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class NexusDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth lo = FirebaseAuth.instance;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green[400],
            ),
            child: Text(
              'Trading Nexus',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Messages'),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(Home.routeName);
            },
          ),
          ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
              onTap: () async {
                Navigator.of(context).pop();
                await lo.signOut();
                //  await FirebaseFirestore.instance.clearPersistence();
                //   _googleSignIn.disconnect();
              }),
        ],
      ),
    );
  }
}
