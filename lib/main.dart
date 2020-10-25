import 'dart:convert';

import 'package:assignment_b2g/provider/dialogue.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'home.dart';
import 'provider/connection.dart';
import 'provider/details.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  return runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<Details>.value(value: Details()),
          ChangeNotifierProvider<Connection>.value(value: Connection()),
          ChangeNotifierProvider<WaitingDialogue>.value(value: WaitingDialogue()),
        ],
        child:MaterialApp(
              debugShowCheckedModeBanner: false, 
              home: new Login()));
  }
}

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var token;

  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  Future loginData() async {
    final Details userDetails = Provider.of<Details>(context, listen: false);
    var url = 'https://rcapp.utech.dev/api/auth/login';
    final response = await http
        .post(url, encoding: Encoding.getByName("utf-8"), body: {
          "email": usernamecontroller.text,
          "password": passwordcontroller.text,
        })
        .timeout(Duration(seconds: 10))
        .catchError((onError) {
          print(onError);
        });
    var result = json.decode(response.body);
    print(result);

    if (result['response'] == "success") {
      var token = result['result']['token'];
      //print(token);
      setState(() {
        userDetails.userDataEmail(usernamecontroller.text);
        userDetails.userDataToken(token);
      });
      //userDetails.token.toString();
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }
    else if (result["response"] != "success") {
      //SystemNavigator.pop();
      _showChoiceDialog(context);
    }
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Wrong User Id or Password"),
                  ),
                  Column(
                    children: <Widget>[
                      RaisedButton(
                        shape: StadiumBorder(),
                        color: Colors.lime,
                        onPressed: () {
                          //Navigator.pop(context);
                          Navigator.pop(context, true);
                        },
                        child: Text("Ok"),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                ],
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    final Connection connection =
        Provider.of<Connection>(context, listen: false);
    connection.connectivityCheck(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final WaitingDialogue waitingDialogue =
        Provider.of<WaitingDialogue>(context, listen: false);
    return Scaffold(
        body: Center(
            child: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.lime[300], Colors.white])),
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "B2GSoft Solution",
                  style: TextStyle(
                    color: Colors.lime[900],
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Login Account",
                  style: TextStyle(
                    color: Colors.lime[800],
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 50.0, right: 8.0, top: 8.0, bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Email",
                      style: TextStyle(
                        color: Colors.lime[900],
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 45,
                  width: 300,
                  child: TextField(
                    controller: usernamecontroller,
                    decoration: InputDecoration(
                      labelText: "Enter Your Email",
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black38,
                          fontSize: 15),
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(50.0),
                        ),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 50.0, right: 8.0, top: 8.0, bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Password",
                      style: TextStyle(
                        color: Colors.lime[900],
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 45,
                  width: 300,
                  child: TextField(
                    controller: passwordcontroller,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Enter Your Password",
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black38,
                          fontSize: 15),
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(50.0),
                        ),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 45,
                  width: 300,
                  child: RaisedButton(
                    onPressed: () {
                      loginData();
                      FocusScope.of(context).unfocus();
                      waitingDialogue.waitingDialogue(context);
                    },
                    color: Colors.lime,
                    shape: StadiumBorder(),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    )));
  }
}
