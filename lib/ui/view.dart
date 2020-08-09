import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class View extends StatefulWidget {
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {

  List s=[];

  @override
  void initState() {
    _load();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title:  Text('View',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Color(0xFFFFFFFF),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: ListView.builder(
      itemCount: s.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(15,8,15,0),
          child: Card(
            child: Container(
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(3),topRight: Radius.circular(3)),
                    child: Container(
                      color: Color(0xFF083663),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(s[index]['Name'],style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ),
                  ),
                  Row(children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text("Contact : ",style: TextStyle(fontWeight: FontWeight.bold),),
                            Padding(
                              padding: const EdgeInsets.only(top:3.0),
                              child: Text(s[index]['Phone'].toString()),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Expanded(flex: 1,child: Container(),),

                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text("Qualification : ",style: TextStyle(fontWeight: FontWeight.bold),),
                            Padding(
                              padding: const EdgeInsets.only(top:3.0),
                              child: Text(s[index]['Qualification'].toString()),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],),


                  Row(children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text("Experience : ",style: TextStyle(fontWeight: FontWeight.bold),),
                            Padding(
                              padding: const EdgeInsets.only(top:3.0),
                              child: Text(s[index]['Experiance'].toString()),
                            ),
                          ],
                        ),
                      ),
                    ),


                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text("Gender : ",style: TextStyle(fontWeight: FontWeight.bold),),
                            Padding(
                              padding: const EdgeInsets.only(top:3.0),
                              child: Text(s[index]['Gender'].toString()),
                            ),
                          ],
                        ),
                      ),
                    ),


                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text("Address : ",style: TextStyle(fontWeight: FontWeight.bold),),
                            Padding(
                              padding: const EdgeInsets.only(top:3.0),
                              child: Text(s[index]['Address'].toString()),
                            ),
                          ],
                        ),
                      ),
                    ),


                  ],)

                ],
              ),
            ),
          ),
        );
      },
      ),
    );
  }

  void _load() async{
    var ur="http://test.matha.co.in/students";
    var resp = await http.get(ur);
    var result = json.decode(resp.body);
    setState(() {
      s=result;
    });
    print(result);
  }
}
