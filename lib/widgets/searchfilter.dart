import 'package:Nexus/main.dart';

//import '../screens/otheruserscreen.dart';
//import 'package:flutter/material.dart';
import '../providers/user.dart';
//import 'package:firebase_storage/firebase_storage.dart'
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geodesy/geodesy.dart';

class SearchFilter {
  String frole;
  String fcity;
  String fproduct;
  double frange;
  List<dynamic> flist = [];
  Useri ouser = Useri();
  var uf = FirebaseFirestore.instance;

  SearchFilter(
      {this.frole = 'Select Role',
      this.fcity = '',
      this.fproduct = '',
      this.frange = 0});

  Future<void> sfiltering(sf) {
    if (sf.frole != 'Select Role' && sf.fcity != '' && sf.fproduct != '') {
      sfilter1(sf);
    }
    if (sf.frole != 'Select Role' && sf.fcity != '') {
      sfilter2(sf);
    }
    if (sf.frole != 'Select Role' && sf.fproduct != '') {
      sfilter3(sf);
    }
    if (sf.product != '' && sf.fcity != '') {
      sfilter3(sf);
    }
  }

  Future<void> sfilter1(SearchFilter sf) async {
    flist = [];
    // searchlist = [];
    //   Geodesy geodesy = Geodesy();
    for (int i = 0; i < usersList.length; i++) {
      print(usersList);
      var ouid = usersList[i];
      print(ouid);
      getData() async {
        return await uf.collection('users').doc(ouid).get();
      }

      await getData().then((val) {
        ouser.role = val.data()['role'];
        ouser.city = val.data()['city'];
        ouser.products = val.data()['products'];
        //    ouser.loci.longitude = val.data()['longitude'];
        //    ouser.loci.latitude = val.data()['latitude'];
      });
      //   LatLng l1 = LatLng(loccoord.latitude, loccoord.longitude);
      // LatLng l2 = LatLng(ouser.loci.latitude, ouser.loci.longitude);
      // int distance = geodesy.distanceBetweenTwoGeoPoints(l1, l2) - 30;
      if (ouser.role == sf.frole &&
              ouser.city == sf.fcity &&
              ouser.products.contains(sf.fproduct)
          //     && distance <= sf.frange
          ) {
        flist.add(ouid);
        searchlist.add(ouid);
        print('result $flist');
      }
    }
  }

  Future<void> sfilter2(SearchFilter sf) async {
    flist = [];
    //   Geodesy geodesy = Geodesy();
    if (sf.frole != 'Select Role' && sf.fcity != '' && sf.fproduct != '') {
      for (int i = 0; i < usersList.length; i++) {
        print(usersList);
        var ouid = usersList[i];
        getData() async {
          return await uf.collection('users').doc(ouid).get();
        }

        await getData().then((val) {
          ouser.role = val.data()['role'];
          ouser.city = val.data()['city'];
          ouser.products = val.data()['products'];
          //    ouser.loci.longitude = val.data()['longitude'];
          //    ouser.loci.latitude = val.data()['latitude'];
        });
        //   LatLng l1 = LatLng(loccoord.latitude, loccoord.longitude);
        // LatLng l2 = LatLng(ouser.loci.latitude, ouser.loci.longitude);
        // int distance = geodesy.distanceBetweenTwoGeoPoints(l1, l2) - 30;
        if (ouser.role == sf.frole &&
                ouser.city == sf.fcity &&
                ouser.products.contains(sf.fproduct)
            //     && distance <= sf.frange
            ) {
          flist.add(ouid);
          searchlist.add(ouid);
          print('result $flist');
        }
      }
    }
  }

  Future<void> sfilter3(SearchFilter sf) async {
    flist = [];
    //searchlist = [];
    //   Geodesy geodesy = Geodesy();
    for (int i = 0; i < usersList.length; i++) {
      print(usersList);
      var ouid = usersList[i];
      print(ouid);
      getData() async {
        return await uf.collection('users').doc(ouid).get();
      }

      await getData().then((val) {
        ouser.role = val.data()['role'];
        ouser.city = val.data()['city'];
        ouser.products = val.data()['products'];
        //    ouser.loci.longitude = val.data()['longitude'];
        //    ouser.loci.latitude = val.data()['latitude'];
      });
      //   LatLng l1 = LatLng(loccoord.latitude, loccoord.longitude);
      // LatLng l2 = LatLng(ouser.loci.latitude, ouser.loci.longitude);
      // int distance = geodesy.distanceBetweenTwoGeoPoints(l1, l2) - 30;
      if (ouser.role == sf.frole &&
              ouser.city == sf.fcity &&
              ouser.products.contains(sf.fproduct)
          //     && distance <= sf.frange
          ) {
        flist.add(ouid);
        searchlist.add(ouid);
        print('result $flist');
      }
    }
  }
}
