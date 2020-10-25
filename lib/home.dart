import 'dart:convert';

import 'package:assignment_b2g/provider/dialogue.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'foodDetails.dart';
import 'provider/details.dart';

class Home extends StatefulWidget {
  //Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List food = [], ingredient = [];

  Future foodData() async {
    final Details userDetails = Provider.of<Details>(context, listen: false);
    //final WaitingDialogue waitingDialogue =
        Provider.of<WaitingDialogue>(context, listen: false);
    var url = 'https://rcapp.utech.dev/api/recipes?token=${userDetails.token}';
    final response = await http
        .get(url)
        .timeout(Duration(seconds: 10))
        .catchError((onError) {
      print(onError);
    });
    //print(url);
    var result = json.decode(response.body);
    //print(result);
    if (result['data'] != null) {
      setState(() {
        food = result['data'];
        if (food.length != null) {
          //Navigator.pop(context, true);
        }
        print(food);
      });
    } else if (result['data'] == null) {
      //SystemNavigator.pop();
      print("error");
      //print(url);
    }
  }

  @override
  void initState() {
    foodData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('B2GSoft Solution Cooking'),
        backgroundColor: Colors.lime,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              SystemNavigator.pop();
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: InkWell(
              child: Container(
                decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.lime[300], Colors.white])),
                width: double.infinity,
                //height: 280,
                height: MediaQuery.of(context).size.height / 3.2,
                //color: Colors.lime[300],
                child: Column(children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),
  ),
                    child: Container(
                      height: 130,
                      width: 190,
                      child: Image.network(food[0]['image_url']),
                    ),
                  ),
                  Text(
                    food[0]['title'] == null
                    ? 'No Name' 
                    : food[0]['title'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Servings:",
                          style: TextStyle(
                            color: Colors.lime[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          food[0]['servings'] == null
                    ? '0' 
                    : food[0]['servings'].toString(),
                          style: TextStyle(
                            color: Colors.lime[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Total time:",
                          style: TextStyle(
                            color: Colors.lime[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          food[0]['total_time'] == null
                    ? '0' 
                    : food[0]['total_time'].toString(),
                          style: TextStyle(
                            color: Colors.lime[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(5.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: <Widget>[
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: <Widget>[
                  //           Text(
                  //             "Prep time:",
                  //             style: TextStyle(
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 15,
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             width: 10,
                  //           ),
                  //           Text(
                  //             food[0]['prep_time'] == null
                  //   ? '0' 
                  //   : food[0]['prep_time'].toString(),
                  //             style: TextStyle(
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 16,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: <Widget>[
                  //           Text(
                  //             "Cook  time:",
                  //             style: TextStyle(
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 15,
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             width: 10,
                  //           ),
                  //           Text(
                              
                  //             food[0]['cook_time'].toString(),
                  //             style: TextStyle(
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 16,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ]),
              ),
              onTap: () {
                List ingredients = food[0]['ingredients'];
                print(ingredients);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FoodDetails(
                          food: food,
                          ingredients: ingredients,
                          )));
              },
            ),
          ),
        ],
      ),
    );
  }
}
