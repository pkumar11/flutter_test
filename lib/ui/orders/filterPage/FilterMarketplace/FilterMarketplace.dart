import 'package:flutter/material.dart';
import 'package:eunimart/ui/orders/Orders.dart';
import 'package:eunimart/util/app_constants.dart';

class FilterMarketplace extends StatefulWidget {
  @override
  _FilterMarketplaceState createState() => _FilterMarketplaceState();
}

class _FilterMarketplaceState extends State<FilterMarketplace> {
  String _value;
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton<String>(
            itemHeight: 50,

            style: TextStyle(
              color: Colors.black,
            ),
            dropdownColor: Colors.white,
            // iconEnabledColor: Colors.black,

            items: [
              DropdownMenuItem<String>(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Checkbox(
                      value: checkboxValue,
                      onChanged: (bool value) {
                        setState(() {
                          checkboxValue = !value;
                        });
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    Text('Ebay'),
                  ],
                ),
                value: '1',
              ),
            ],
            onChanged: (String value) {
              setState(() {
                _value = value;
                checkboxValue = !checkboxValue;
              });
            },
            hint: Text(
              'Select Item',
              style: TextStyle(color: Colors.black),
            ),
            value: _value,
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: RaisedButton(
              onPressed: () {
                print('pppp $checkboxValue');
                if (checkboxValue) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      settings: RouteSettings(name: ROUTE_ORDERSHIPMENT),
                      builder: (context) => Orders(filterValue: 1),
                    ),
                  );
                } else {
                  Navigator.pop(context);
                }
              },
              child: Text('Filter'),
            ),
          )
        ],
      ),
    );
  }
}
