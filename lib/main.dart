import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          body: SafeArea(
            child: Column(children: <Widget>[
              FutureBuilder(future: getTiming(), builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
                return Container(child: Text("${snapshot.data['BusStopCode']}"),);
              },),
            ],),
          ),
        ));
  }
}



Map<String, String> get headers =>{
  "AccountKey" : "1dVX8C0fTAiUzAV1ORynVg=="
};

Future<Map> getTiming() async {
  var url = 'http://datamall2.mytransport.sg/ltaodataservice/BusArrivalv2?BusStopCode=83139';

  final response = await http.get(url, headers: headers);
  Map code = jsonDecode(response.body);
  return code;
}