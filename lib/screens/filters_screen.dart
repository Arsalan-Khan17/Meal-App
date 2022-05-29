import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, VoidCallback? updateValue(bool newVal)) {
    try {
      return SwitchListTile(
        title: Text(title),
        subtitle: Text(description),
        value: currentValue,
        onChanged: updateValue,
      );
    } catch (e) {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Your Filters')),
        drawer: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: MainDrawer(),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust Your Meal Selection',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchListTile(
                    'Gluten-Free', 'Only Include Gluten-Free', _glutenFree,
                    (newVal) {
                  setState(() {
                    _glutenFree = newVal;
                  });
                }),
                _buildSwitchListTile(
                    'Lactose-Free', 'Only Include Lactose-Free', _lactoseFree,
                    (newVal) {
                  setState(() {
                    _lactoseFree = newVal;
                  });
                }),
                _buildSwitchListTile('Vegan', 'Only Include Vegan', _vegan,
                    (newVal) {
                  setState(() {
                    _vegan = newVal;
                  });
                }),
                _buildSwitchListTile(
                    'Vegetarian', 'Only Include Vegetarian', _vegetarian,
                    (newVal) {
                  setState(() {
                    _vegetarian = newVal;
                  });
                }),
              ],
            ))
          ],
        ));
  }
}
