import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> places = ['Carrefour', 'Shayboub'];
  final List<String> carrefourBranches = ['city-centre', 'city-light', 'cairo'];
  final List<String> shayboubBranches = ['louran', 'Victoria', 'giza'];

  List<String> branches = [];
  String selectedPlace;
  String selectedBranch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            DropdownButton<String>(
              /// place dropdown
              hint: Text('Select Place'),
              value: selectedPlace,
              isExpanded: true,
              items: places.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: onChangedCallback,
            ),
            DropdownButton<String>(
              /// branch dropdown
              hint: Text('Select branch'),
              isExpanded: true,
              value: selectedBranch,
              items: branches.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (branch) {
                setState(() {
                  selectedBranch = branch;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  void onChangedCallback(place) {
    if (place == 'Carrefour') {
      branches = carrefourBranches;
    } else if (place == 'Shayboub') {
      branches = shayboubBranches;
    } else {
      branches = [];
    }
    setState(() {
      selectedBranch = null;
      selectedPlace = place;
    });
  }
}
