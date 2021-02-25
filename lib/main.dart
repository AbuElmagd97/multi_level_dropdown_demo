import 'package:flutter/material.dart';
import 'package:multi_level_menu_demo/provider/chains_provider.dart';
import 'package:multi_level_menu_demo/widgets/custom_drop.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChainsProvider>(
      create: (_)=> ChainsProvider(),
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
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
                  child: Consumer<ChainsProvider>(
                    builder: (_, provider, __) {
                      return CustomDropdownButton(
                        value: provider.selectedPlace,
                        hint: Text('Select Place'),
                        items: provider.places.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: provider.onChangedCallback,
                      );
                    },
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
                  child: Consumer<ChainsProvider>(
                    builder: (_,provider,__){
                      return CustomDropdownButton(
                        value: provider.selectedBranch,
                        hint: Text('Select branch'),
                        items: provider.branches.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: provider.setSelectedBranch,
                      );
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
}
