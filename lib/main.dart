import 'package:flutter/material.dart';
import 'package:multi_level_menu_demo/widgets/custom_drop.dart';

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
            Container(
              height: 65,
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Chain',
                  labelStyle: Theme.of(context)
                      .primaryTextTheme
                      .caption
                      .copyWith(color: Colors.black, fontSize: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                child: DropdownButtonHideUnderline(
                  child: CustomDropdownButton(
                    value: selectedPlace,
                    hint: Text('Select Place'),
                    items: places.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: onChangedCallback,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 65,
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Branch',
                  labelStyle: Theme.of(context)
                      .primaryTextTheme
                      .caption
                      .copyWith(color: Colors.black, fontSize: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                child: DropdownButtonHideUnderline(
                  child: CustomDropdownButton(
                    value: selectedBranch,
                    hint: Text('Select branch'),
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
                ),
              ),
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
