import 'package:flutter/material.dart';

class FilterStatus extends StatefulWidget {
  @override
  _FilterStatusState createState() => _FilterStatusState();
}

class _FilterStatusState extends State<FilterStatus> {
  bool newValue = false;
  bool shippedValue = false;
  bool deliveredValue = false;
  bool readyValue = false;
  bool cancelValue = false;
  var list = [];
  String url;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListTile(
          onTap: () {
            if (newValue) {
              this.list.add('new');
            }

            setState(() {
              url =
                  "https://idp-testing.vdezi.com/api/v2/orders_managment/orders/list?status%5B0%5D=new&account_id=";
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
          title: Text('New'),
        ),
        ListTile(
          onTap: () {
            setState(() {
              url = "";
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
          title: Text('Shipped'),
        ),
        ListTile(
          onTap: () {
            setState(() {
              deliveredValue = !deliveredValue;
            });
          },
          leading: Checkbox(onChanged: (bool value) {}, value: deliveredValue),
          title: Text('Delivered'),
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
          title: Text('Ready to ship'),
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
          title: Text('Cancel'),
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
