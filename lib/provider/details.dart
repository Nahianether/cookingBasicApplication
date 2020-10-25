import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Details extends ChangeNotifier {
  var email;
  var token;

  userDataEmail(var userEmail) {
    email = userEmail;
    notifyListeners();
  }

  userDataToken(var userToken) {
    token = userToken;
    notifyListeners();
  }

}
