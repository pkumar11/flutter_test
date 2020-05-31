import 'package:flutter/material.dart';
import 'package:eunimart/ui/Logistics/Planning/Planning_vm.dart';
import 'package:eunimart/app_models.dart';
import 'package:eunimart/util/app_constants.dart';
import 'package:eunimart/ui/Logistics/Planning/PlanningList/PlanningList.dart';

class Planning extends StatefulWidget {
  @override
  _PlanningState createState() => _PlanningState();
}

class _PlanningState extends State<Planning> {
  String fromDropdownValue = 'India';
  String toDropdownValue = 'Select';
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _packageLength = TextEditingController();
  TextEditingController _packageBreadth = TextEditingController();
  TextEditingController _packageHeight = TextEditingController();
  TextEditingController _packageweight = TextEditingController();

  PlanningVM planningVM = PlanningVM();

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Planning'),
      ),
      backgroundColor: Colors.white70,
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Please fill the details',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'From :',
                      style: TextStyle(color: Colors.black),
                    ),
                    DropdownButton<String>(
                      value: fromDropdownValue,
                      dropdownColor: Colors.white,
                      icon: Icon(
                        Icons.arrow_downward,
                        color: Colors.black,
                      ),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.black),
                      underline: Container(
                        height: 2,
                        color: Colors.blue,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          fromDropdownValue = newValue;
                        });
                      },
                      items: <String>['India']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'To :',
                      style: TextStyle(color: Colors.black),
                    ),
                    DropdownButton<String>(
                      dropdownColor: Colors.white,
                      value: toDropdownValue,
                      icon: Icon(Icons.arrow_downward, color: Colors.black),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.black),
                      underline: Container(
                        height: 2,
                        color: Colors.blue,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          toDropdownValue = newValue;
                        });
                      },
                      items: <String>[
                        'Select',
                        'China',
                        'United States',
                        'Russia',
                        'Dubai',
                        'Australia',
                        'Bangladesh'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Package length',
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: w,
                  color: Colors.blue,
                  child: TextField(
                      style: TextStyle(color: Colors.black),
                      controller: _packageLength,
                      enableInteractiveSelection: false,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        fillColor: Colors.grey,
                        hintText: 'Enter Package length (in cm)',
                        filled: true,
                        border: InputBorder.none,
                        counterText: "",
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Package Breadth',
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: w,
                  color: Colors.blue,
                  child: TextField(
                      style: TextStyle(color: Colors.black),
                      controller: _packageBreadth,
                      enableInteractiveSelection: false,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        fillColor: Colors.grey,
                        hintText: 'Enter Package Breadth (in cm)',
                        filled: true,
                        border: InputBorder.none,
                        counterText: "",
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Package Height',
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: w,
                  color: Colors.blue,
                  child: TextField(
                      style: TextStyle(color: Colors.black),
                      controller: _packageHeight,
                      enableInteractiveSelection: false,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        fillColor: Colors.grey,
                        hintText: 'Enter Package Height (in cm)',
                        filled: true,
                        border: InputBorder.none,
                        counterText: "",
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Package Weight',
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: w,
                  color: Colors.blue,
                  child: TextField(
                      style: TextStyle(color: Colors.black),
                      controller: _packageweight,
                      enableInteractiveSelection: false,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        fillColor: Colors.grey,
                        hintText: 'Enter Package weight(in kg)',
                        filled: true,
                        border: InputBorder.none,
                        counterText: "",
                      )),
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  child: RaisedButton(
                    onPressed: _onSubmitClicked,
                    child: Text(
                      'Get live quotes',
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _onSubmitClicked() async {
    // validate
    String length = _packageLength.text.trim();
    // double length=double.parse('$_packageLength');
    String width = _packageBreadth.text.trim();
    String height = _packageHeight.text.trim();

    String weight = _packageweight.text.trim();

    print(
        '$length  $width  $height  $weight $fromDropdownValue   $toDropdownValue');

    if (length.isEmpty) {
      showSnackBarMessage("Please enter length", _scaffoldKey);
    } else if (width.isEmpty) {
      showSnackBarMessage("Please enter width", _scaffoldKey);
    } else if (height.isEmpty) {
      showSnackBarMessage("Please enter height", _scaffoldKey);
    } else if (weight.isEmpty) {
      showSnackBarMessage("Please enter weight", _scaffoldKey);
    } else {
      //call API
      //Future<LoginRes> fres = loginVM.callLoginAPI(email, password);
      PlanningRes res = await planningVM.submitPlanningData(
          double.parse('$length'),
          double.parse('$width'),
          double.parse('$height'),
          double.parse('$weight'),
          fromDropdownValue.toString(),
          toDropdownValue.toString());
      print('${res.data} ??????');
      if (!res.status) {
        showSnackBarMessage("Wrong input", _scaffoldKey);
        return;
      } else {
        print(res.data);
        Navigator.push(
          context,
          MaterialPageRoute(
              settings: RouteSettings(name: ROUTE_PLANNINGLIST),
              builder: (context) => PlanningList(data: res.data.toList())),
        );
      }
    }
  }
}
