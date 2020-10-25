import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WaitingDialogue extends ChangeNotifier {
  Future waitingDialogue(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Shimmer.fromColors(
                    direction: ShimmerDirection.ltr,
                    baseColor: Colors.black,
                    period: Duration(milliseconds: 700),
                    highlightColor: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(" Please wait while loading.... ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                decoration: TextDecoration.none)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
