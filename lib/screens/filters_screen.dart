import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FilterScreen(this.saveFilters, this.currentFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _GlutenFree = false;
  var _Vegan = false;
  var _Vegetarian = false;
  var _LactoseFree = false;

  @override
  void initState() {
    _GlutenFree = widget.currentFilters['gluten']!;
    _LactoseFree = widget.currentFilters['lactose']!;
    _Vegan = widget.currentFilters['vegan']!;
    _Vegetarian = widget.currentFilters['vegetarian']!;
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: ((value) {
        updateValue(value);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filtesr'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _GlutenFree,
                'lactose': _LactoseFree,
                'vegan': _Vegan,
                'vegetarian': _Vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection.',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile(
                    'Gluten-free',
                    'Only include gluten-free meals.',
                    _GlutenFree,
                    (newValue) {
                      setState(
                        () {
                          _GlutenFree = newValue;
                        },
                      );
                    },
                  ),
                  _buildSwitchListTile(
                    'Lactose-free',
                    'Only include lactose-free meals.',
                    _LactoseFree,
                    (newValue) {
                      setState(
                        () {
                          _LactoseFree = newValue;
                        },
                      );
                    },
                  ),
                  _buildSwitchListTile(
                    'Vegetarian',
                    'Only include Vegetarian meals.',
                    _Vegetarian,
                    (newValue) {
                      setState(
                        () {
                          _Vegetarian = newValue;
                        },
                      );
                    },
                  ),
                  _buildSwitchListTile(
                    'Vegan',
                    'Only include Vegan meals.',
                    _Vegan,
                    (newValue) {
                      setState(
                        () {
                          _Vegan = newValue;
                        },
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
