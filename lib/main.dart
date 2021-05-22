import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

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
      home: SplashScreenView(
        home: MyHomePage(title: 'Flutter Demo Home Page'),
        duration: 3000,
        imageSize: 230,
        imageSrc: "assets/images/splash.jpg",
        text: "Welcome",
        textType: TextType.ScaleAnimatedText,
        textStyle: TextStyle(
          fontSize: 30.0,
        ),
        backgroundColor: Colors.white,
      )
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
  static  var mytime=TimeOfDay(hour: 0, minute:0) ;//time will taken from time picker
 static var mydate=DateTime(0,0,0) ;//date will taken from date picker

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(


        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$mydate'),
            Text('$mytime'),
            InkWell( child: Text("enter date &time",style: TextStyle(fontSize: 40),),
            onTap: (){
              setState(() {
                _theFunct();
              });
            },),]






        ),
      ),
    );
  }

  void _theFunct() async{
      mytime = await  showTimePicker(context: context, initialTime: TimeOfDay.now());
    print(mytime);
    mydate = await showDatePicker(

                      context: context,
                      initialDate: DateTime(2000),
                      firstDate: DateTime(1000),
                      lastDate: DateTime(2021));
                  print(mydate);
                  //ScaffoldMessenger.showsnackbar(snackbar())
      SnackBar(
        content: Text('sorry I cannot find the the problem'),
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: 'ok',
          onPressed: (){
            Navigator.pop;
          },

        ),

      );

  }
}
