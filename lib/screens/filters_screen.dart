import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Map<String, bool> currentFilters;
  final Function saveFilters;
  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      value: currentValue,
      title: Text(title),
      subtitle: Text('Only include $description meals'),
      onChanged: (newValue) => updateValue(newValue),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Center(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Adjust meal selection"),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              _buildSwitchListTile(
                "Gluten-Free",
                "gluten free",
                _glutenFree,
                (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                },
              ),
              _buildSwitchListTile(
                "Vegetarian",
                "vegetarian",
                _vegetarian,
                (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                },
              ),
              _buildSwitchListTile(
                "Vegan",
                "vegan",
                _vegan,
                (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                },
              ),
              _buildSwitchListTile(
                "Lactose-Free",
                "lactose free",
                _lactoseFree,
                (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                },
              ),
            ],
          ))
        ],
      )),
    );
  }
}
