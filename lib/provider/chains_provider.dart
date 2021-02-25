import 'package:flutter/cupertino.dart';

class ChainsProvider with ChangeNotifier {
  final List<String> places = ['Carrefour', 'Shayboub'];
  final List<String> carrefourBranches = ['city-centre', 'city-light', 'cairo'];
  final List<String> shayboubBranches = ['louran', 'Victoria', 'giza'];

  List<String> branches = [];
  String selectedPlace;
  String selectedBranch;


  void onChangedCallback(place) {
    if (place == 'Carrefour') {
      branches = carrefourBranches;
    } else if (place == 'Shayboub') {
      branches = shayboubBranches;
    } else {
      branches = [];
    }
      selectedBranch = null;
      selectedPlace = place;
      notifyListeners();
  }
  void setSelectedBranch(String branch) {
    selectedBranch = branch;
    notifyListeners();
  }
}