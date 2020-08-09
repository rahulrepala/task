import 'package:flutter/material.dart';
import 'package:task/ui/view.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class Gender {
  int id;
  String gender;

  Gender(this.id, this.gender);

  static List<Gender> getGender() {
    return <Gender>[
      Gender(1, 'Male'),
      Gender(2, 'Female'),
      Gender(3, 'Others'),
    ];
  }
}

class _RegisterState extends State<Register> {

  String gender = "Male";
  var _name = TextEditingController();
  var _ph = TextEditingController();
  var _address = TextEditingController();
  var _qualification = TextEditingController();
  var _experience = TextEditingController();
  var _marks1 = TextEditingController();
  var _marks2 = TextEditingController();
  var _ssc = TextEditingController();
  var _inter = TextEditingController();

  List<TextEditingController> _education = [];
  List<TextEditingController> _institute = [];
  List<TextEditingController> _marks = [];

  List<Gender> _gender = Gender.getGender();
  List<DropdownMenuItem<Gender>> _dropdownMenuItems;
  Gender _selectedGender;

  @override
  void initState() {
    _education.add(TextEditingController());
    _institute.add(TextEditingController());
    _marks.add(TextEditingController());
    _dropdownMenuItems = buildDropDownMenuItems(_gender);
    _selectedGender = _dropdownMenuItems[0].value;
    super.initState();
  }


  List<DropdownMenuItem<Gender>> buildDropDownMenuItems(List genders) {
    List<DropdownMenuItem<Gender>> items = List();
    for (Gender gender in genders) {
      items.add(DropdownMenuItem(
        value: gender,
        child: Text(gender.gender),
      ));
    }
    return items;
  }

  onChangeDropDownItem(Gender selectedGender) {
    setState(() {
      _selectedGender = selectedGender;
      gender = selectedGender.gender;
    });
  }
  final GlobalKey<ScaffoldState> _sk = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _sk,
      appBar: AppBar(
        elevation: 0,
        title:  Text('Register',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Color(0xFFFFFFFF),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      drawer: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width*0.6,
          child: Drawer(
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                  child: Image.asset(
                    'assets/images/logo.png'
                    ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                ),
                ListTile(
                  title: Text('Register',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('View',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => View()),
                            (Route<dynamic> route) => true);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  maxLines: 1,
                  controller: _name,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(15,10,10,10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey, width: 1.0),
                        borderRadius:
                        BorderRadius.all(Radius.circular(10.0)),
                      ),
                      border: OutlineInputBorder(),
                      hintText: "Name",
                      hintStyle:
                      TextStyle(color: Colors.black26, fontSize: 16.0)),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,20,20),
                child: TextFormField(
                  maxLines: 1,
                  controller: _ph,
                  keyboardType: TextInputType.phone,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(15,10,10,10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey, width: 1.0),
                        borderRadius:
                        BorderRadius.all(Radius.circular(10.0)),
                      ),
                      border: OutlineInputBorder(),
                      hintText: "Phone Number",
                      hintStyle:
                      TextStyle(color: Colors.black26, fontSize: 16.0)),
                       ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,20,20),
                child: TextFormField(
                  maxLines: 1,
                  controller: _address,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(15,10,10,10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey, width: 1.0),
                        borderRadius:
                        BorderRadius.all(Radius.circular(10.0)),
                      ),
                      border: OutlineInputBorder(),
                      hintText: "Address",
                      hintStyle:
                      TextStyle(color: Colors.black26, fontSize: 16.0)),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,20,20),
                child: TextFormField(
                  maxLines: 1,
                  controller: _qualification,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(15,10,10,10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey, width: 1.0),
                        borderRadius:
                        BorderRadius.all(Radius.circular(10.0)),
                      ),
                      border: OutlineInputBorder(),
                      hintText: "Qualification",
                      hintStyle:
                      TextStyle(color: Colors.black26, fontSize: 16.0)),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,20,20),
                child: TextFormField(
                  maxLines: 1,
                  controller: _experience,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(15,10,10,10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey, width: 1.0),
                        borderRadius:
                        BorderRadius.all(Radius.circular(10.0)),
                      ),
                      border: OutlineInputBorder(),
                      hintText: "Experience",
                      hintStyle:
                      TextStyle(color: Colors.black26, fontSize: 16.0)),
                ),
              ),

             /* Padding(
                padding: const EdgeInsets.fromLTRB(20,0,20,20),
                child: TextFormField(
                  maxLines: 1,
                  controller: _ssc,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(15,10,10,10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey, width: 1.0),
                        borderRadius:
                        BorderRadius.all(Radius.circular(10.0)),
                      ),
                      border: OutlineInputBorder(),
                      hintText: "SSC Institute",
                      hintStyle:
                      TextStyle(color: Colors.black26, fontSize: 16.0)),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,20,20),
                child: TextFormField(
                  maxLines: 1,
                  controller: _marks1,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(15,10,10,10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey, width: 1.0),
                        borderRadius:
                        BorderRadius.all(Radius.circular(10.0)),
                      ),
                      border: OutlineInputBorder(),
                      hintText: "SSC Marks",
                      hintStyle:
                      TextStyle(color: Colors.black26, fontSize: 16.0)),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,20,20),
                child: TextFormField(
                  maxLines: 1,
                  controller: _inter,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(15,10,10,10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey, width: 1.0),
                        borderRadius:
                        BorderRadius.all(Radius.circular(10.0)),
                      ),
                      border: OutlineInputBorder(),
                      hintText: "Inter Institute",
                      hintStyle:
                      TextStyle(color: Colors.black26, fontSize: 16.0)),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,20,8),
                child: TextFormField(
                  maxLines: 1,
                  controller: _marks2,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(15,10,10,10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey, width: 1.0),
                        borderRadius:
                        BorderRadius.all(Radius.circular(10.0)),
                      ),
                      border: OutlineInputBorder(),
                      hintText: "Inter Marks",
                      hintStyle:
                      TextStyle(color: Colors.black26, fontSize: 16.0)),
                ),
              ),
*/

             Padding(
               padding: const EdgeInsets.fromLTRB(20,0,20,8),
               child: Card(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[
                     Padding(
                       padding: const EdgeInsets.only(top:8.0,left: 15),
                       child: Text("Education :",style: TextStyle(fontWeight: FontWeight.bold),),
                     ),

                     Container(
                       height: _education.length*MediaQuery.of(context).size.height*0.08,
                       child: ListView.builder(
                           physics: NeverScrollableScrollPhysics(),
                           padding: const EdgeInsets.all(8),
                           itemCount: _education.length,
                           itemBuilder: (BuildContext context, int index) {
                             return Container(
                               width: MediaQuery.of(context).size.width*0.8,
                               child: Row(
                                 children: <Widget>[
                                   Flexible(
                                     child: Padding(
                                       padding: const EdgeInsets.fromLTRB(5,0,5,8),
                                       child: TextFormField(
                                         maxLines: 1,
                                         controller: _education[index],
                                         keyboardType: TextInputType.text,
                                         style: TextStyle(
                                             fontSize: 16,
                                             color: Colors.black,
                                             fontWeight: FontWeight.w400),
                                         decoration: InputDecoration(
                                             contentPadding: EdgeInsets.fromLTRB(15,10,10,10),
                                             enabledBorder: OutlineInputBorder(
                                               borderSide: BorderSide(
                                                   color: Colors.grey, width: 1.0),
                                               borderRadius:
                                               BorderRadius.all(Radius.circular(10.0)),
                                             ),
                                             border: OutlineInputBorder(),
                                             hintText: "education",
                                             hintStyle:
                                             TextStyle(color: Colors.black26, fontSize: 16.0)),
                                       ),
                                     ),
                                   ),

                                   Flexible(
                                     child: Padding(
                                       padding: const EdgeInsets.fromLTRB(5,0,5,8),
                                       child: TextFormField(
                                         maxLines: 1,
                                         controller: _institute[index],
                                         keyboardType: TextInputType.text,
                                         style: TextStyle(
                                             fontSize: 16,
                                             color: Colors.black,
                                             fontWeight: FontWeight.w400),
                                         decoration: InputDecoration(
                                             contentPadding: EdgeInsets.fromLTRB(15,10,10,10),
                                             enabledBorder: OutlineInputBorder(
                                               borderSide: BorderSide(
                                                   color: Colors.grey, width: 1.0),
                                               borderRadius:
                                               BorderRadius.all(Radius.circular(10.0)),
                                             ),
                                             border: OutlineInputBorder(),
                                             hintText: "institute",
                                             hintStyle:
                                             TextStyle(color: Colors.black26, fontSize: 16.0)),
                                       ),
                                     ),
                                   ),

                                   Flexible(
                                     child: Padding(
                                       padding: const EdgeInsets.fromLTRB(5,0,5,8),
                                       child: TextFormField(
                                         maxLines: 1,
                                         controller: _marks[index],
                                         keyboardType: TextInputType.number,
                                         style: TextStyle(
                                             fontSize: 16,
                                             color: Colors.black,
                                             fontWeight: FontWeight.w400),
                                         decoration: InputDecoration(
                                             contentPadding: EdgeInsets.fromLTRB(15,10,10,10),
                                             enabledBorder: OutlineInputBorder(
                                               borderSide: BorderSide(
                                                   color: Colors.grey, width: 1.0),
                                               borderRadius:
                                               BorderRadius.all(Radius.circular(10.0)),
                                             ),
                                             border: OutlineInputBorder(),
                                             hintText: "marks",
                                             hintStyle:
                                             TextStyle(color: Colors.black26, fontSize: 16.0)),
                                       ),
                                     ),
                                   )
                                 ],
                               ),
                             );
                           }
                       ),
                     ),

                   Padding(
                     padding: const EdgeInsets.fromLTRB(8.0,0,15,8),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: <Widget>[
                         RaisedButton(
                           shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(18.0),
                               side: BorderSide(color: Colors.red)),
                           onPressed: (){
                             setState(() {
                               _education.add(TextEditingController());
                               _institute.add(TextEditingController());
                               _marks.add(TextEditingController());
                             });
                           },
                           color: Colors.white,
                           textColor: Colors.red,
                           child: Text("Add More",
                               style: TextStyle(fontSize: 14)),
                         ),
                       ],
                     ),
                   )

                   ],
                 ),
               ),
             ),

              Padding(
                padding: const EdgeInsets.fromLTRB(25.0,0,40,40),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Gender : ',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          DropdownButton(
                            value: _selectedGender,
                            items: _dropdownMenuItems,
                            onChanged: onChangeDropDownItem,
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      flex: 1,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)),
                        onPressed: () async {

                          List edu=[];
                          for(int i=0;i<_education.length;i++){
                            edu.add(
                              {
                                "education": _education[i].text.toString(),
                                "institute": _institute[i].text.toString(),
                                "marks": _marks[i].text.toString()
                              }
                            );
                          }

                          print(edu);

                          if(_name.text!="" && _ph.text!="" &&_address.text!="" && _qualification.text!="" &&_experience.text!="" ){

                            var url = 'http://test.matha.co.in/createstudent';
                            var resp = await http.post(
                              url,
                              headers: {
                                'Content-Type': 'application/json',
                              },
                              body: json.encode(<String, dynamic>{
                                "name": _name.text.toString(),
                                "phone": _ph.text.toString(),
                                "gender": gender,
                                "address": _address.text.toString(),
                                "qualification": _qualification.text.toString(),
                                "experiance": _experience.text.toString()+" Experience",
                                "EducationDetails": edu
                              }),
                            );
                         var result = json.decode(resp.body);
                         print(result);
                           if (result == 'Record Created') {
                             _name.clear();
                             _ph.clear();
                             _address.clear();
                             _qualification.clear();
                             _experience.clear();
                             _institute.clear();
                             _education.clear();
                             _marks.clear();

                             _education.add(TextEditingController());
                             _institute.add(TextEditingController());
                             _marks.add(TextEditingController());

                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => View()),
                                      (Route<dynamic> route) => true);
                            }

                          }else{

                            _sk.currentState.showSnackBar(SnackBar(
                              content: Text(
                               "You need to enter all details",
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 15,
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12.0),
                                      topRight: Radius.circular(12.0))),
                              duration: Duration(seconds: 1),
                              backgroundColor: Colors.red,
                            ));

                          }

                        },
                        color: Colors.white,
                        textColor: Colors.red,
                        child: Text("SUBMIT",
                            style: TextStyle(fontSize: 14)),
                      ),
                    ),
                  ],
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}
