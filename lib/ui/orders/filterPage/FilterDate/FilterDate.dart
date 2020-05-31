import 'package:flutter/material.dart';

class FilterDate extends StatefulWidget {
  @override
  _FilterDateState createState() => _FilterDateState();
}

class _FilterDateState extends State<FilterDate> {
  bool newValue = false;
  bool shippedValue = false;
  bool deliveredValue = false;
  bool readyValue = false;
  bool cancelValue = false;
  DateTime _currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    print(_currentDate);
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListTile(
          onTap: () {
            setState(() {
              newValue = !newValue;
            });
          },
          leading: Checkbox(
            onChanged: (bool value) {
              setState(() {
                newValue = value;
              });
            },
            value: newValue,
          ),
          title: Text('Today'),
        ),
        ListTile(
          onTap: () {
            setState(() {
              shippedValue = !shippedValue;
            });
          },
          leading: Checkbox(
            onChanged: (bool value) {
              setState(() {
                shippedValue = value;
              });
            },
            value: shippedValue,
          ),
          title: Text('Yesterday'),
        ),
        ListTile(
          onTap: () {
            setState(() {
              deliveredValue = !deliveredValue;
            });
          },
          leading: Checkbox(onChanged: (bool value) {}, value: deliveredValue),
          title: Text('Last 7 days'),
        ),
        ListTile(
          onTap: () {
            setState(() {
              readyValue = !readyValue;
            });
          },
          leading: Checkbox(
            onChanged: (bool value) {},
            value: readyValue,
          ),
          title: Text('Last 30 Days'),
        ),
        ListTile(
          onTap: () {
            setState(() {
              cancelValue = !cancelValue;
            });
          },
          leading: Checkbox(
            onChanged: (bool value) {},
            value: cancelValue,
          ),
          title: Text('This Month'),
        ),
        ListTile(
          onTap: () {
            setState(() {
              cancelValue = !cancelValue;
            });
          },
          leading: Checkbox(
            onChanged: (bool value) {},
            value: cancelValue,
          ),
          title: Text('Last Month'),
        ),
        Container(
          child: RaisedButton(
            onPressed: () {},
            child: Text('Filter'),
          ),
        )
      ],
    ));
  }
}
