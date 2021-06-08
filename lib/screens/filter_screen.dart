import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  // const FiltersScreen({ Key? key }) : super(key: key);

  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _gultenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    _gultenFree = widget.currentFilters['gulten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget _builsSwitchListTile(String title, bool currentValue,
      String description, Function updateValue) {
    SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(
        description,
      ),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hello Filter title"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gulten': _gultenFree,
                  'vegetarian': _vegetarian,
                  'vegan': _vegan,
                  'lactose': _lactoseFree
                };
                widget.saveFilters(selectedFilters);
              },
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust Your Meal Selection',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
                child: ListView(
              children: <Widget>[
                _builsSwitchListTile("Gulten Free", _gultenFree,
                    'Only Contains Gulten Free meal', (newValue) {
                  setState(() {
                    _gultenFree = newValue;
                  });
                }),
                _builsSwitchListTile(
                  'vegetarian',
                  _vegetarian,
                  "Only includes Vegetarian meal",
                  (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                _builsSwitchListTile(
                  'Vegan',
                  _vegan,
                  "Only includes Vegan meal",
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
                _builsSwitchListTile(
                  'Lactose free',
                  _lactoseFree,
                  "Only includes lactose-free meal",
                  (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                )
              ],
            ))
          ],
        ));
  }
}
