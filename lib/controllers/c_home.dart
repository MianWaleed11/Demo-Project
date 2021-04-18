import 'dart:convert';

import 'package:demo_app/model/cars_model.dart';
import 'package:demo_app/network/server.dart';
import 'package:flutter/cupertino.dart';

class CHome extends ChangeNotifier {
  bool isLoading = true;
  List<CarsModel> carsList;

  CHome() {
    getCars();
  }

  Future<void> getCars() async {
    var response = await Server.getCars();

    if (response.statusCode == 200) {
      try {
        carsList = (json.decode(response.body) as List)
            .map((i) => CarsModel.fromJson(i))
            .toList();
        isLoading = false;
        notifyListeners();
      } catch (ex) {
        isLoading = false;
        notifyListeners();
      }
    } else {
      isLoading = false;
      notifyListeners();
    }
  }
}
