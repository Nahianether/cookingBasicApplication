import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FoodDetails extends StatefulWidget {
  List food, ingredient;

  FoodDetails({Key key, this.food, this.ingredient, List ingredients})
      : super(key: key);

  @override
  _FoodDetailsState createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  ingredients() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Text(
              "Ingredients:",
              style: TextStyle(
                color: Colors.lime[700],
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Text(
                '${widget.food[0]['ingredients']}' == null
                    ? 'No Data'
                    : '${widget.food[0]['ingredients']}',
                style: TextStyle(
                  color: Colors.lime[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  directions() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Text(
              "Description:",
              style: TextStyle(
                color: Colors.lime[700],
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Text(
                '${widget.food[0]['directions']}' == null
                    ? 'No Data'
                    : '${widget.food[0]['directions']}',
                style: TextStyle(
                  color: Colors.lime[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  var a;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              //color: Colors.blueAccent,
              image: DecorationImage(
                image: NetworkImage('${widget.food[0]['image_url']}'),
                fit: BoxFit.fill,
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.6), BlendMode.dstATop),
              ),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${widget.food[0]['title']}' == null
                  ? 'No Name'
                  : '${widget.food[0]['title']}',
              style: TextStyle(
                color: Colors.lime[900],
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Text(
                  "Servings:",
                  style: TextStyle(
                    color: Colors.lime[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '${widget.food[0]['servings']}' == null
                      ? '0'
                      : '${widget.food[0]['servings']}',
                  style: TextStyle(
                    color: Colors.lime[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Text(
                  "Total Time:",
                  style: TextStyle(
                    color: Colors.lime[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '${widget.food[0]['total_time']}' == null
                      ? '0'
                      : '${widget.food[0]['total_time']}',
                  style: TextStyle(
                    color: Colors.lime[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Text(
                  "Preparation Time:",
                  style: TextStyle(
                    color: Colors.lime[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '${widget.food[0]['prep_time']}' == null
                      ? '0'
                      : '${widget.food[0]['prep_time']}',
                  style: TextStyle(
                    color: Colors.lime[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Text(
                  "Cooking Time:",
                  style: TextStyle(
                    color: Colors.lime[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '${widget.food[0]['cook_time']}' == null
                      ? '0'
                      : '${widget.food[0]['cook_time']}',
                  style: TextStyle(
                    color: Colors.lime[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Text(
                  "Notes:",
                  style: TextStyle(
                    color: Colors.lime[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '${widget.food[0]['notes']}' == null
                      ? 'No Notes'
                      : '${widget.food[0]['notes']}',
                  style: TextStyle(
                    color: Colors.lime[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Text(
                  "Created at:",
                  style: TextStyle(
                    color: Colors.lime[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '${widget.food[0]['created_at']}' == null
                      ? 'No Data'
                      : '${widget.food[0]['created_at']}',
                  style: TextStyle(
                    color: Colors.lime[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Text(
                  "SourceURL:",
                  style: TextStyle(
                    color: Colors.lime[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    '${widget.food[0]['source_url']}' == null
                        ? 'No Source'
                        : '${widget.food[0]['source_url']}',
                    style: TextStyle(
                      color: Colors.lime[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Text(
                  "Source:",
                  style: TextStyle(
                    color: Colors.lime[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: 35,
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    '${widget.food[0]['source']}' == null
                        ? 'No Source'
                        : '${widget.food[0]['source']}',
                    style: TextStyle(
                      color: Colors.lime[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  color: Colors.lime,
                  onPressed: () {
                    setState(() {
                      a = ingredients();
                    });
                  },
                  child: Text("Ingredients",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  ),
                ),
                RaisedButton(
                  color: Colors.lime,
                  onPressed: () {
                    setState(() {
                      a = directions();
                    });
                  },
                  child: Text("Description",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: a,
          ),
        ],
      ),
    );
  }
}
