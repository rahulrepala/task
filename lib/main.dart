import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:task/ui/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SplashScreen(
          seconds: 4,
          navigateAfterSeconds: Register(),
          image:Image.asset(
            'assets/images/logo.png'
          ),
          photoSize: 200,
          backgroundColor: Colors.white,
          loaderColor: Colors.red,
        ),
        )
      );
  }
}
