import 'package:flutter/material.dart';
import 'package:eunimart/util/app_constants.dart';
import 'package:eunimart/ui/Logistics/Create_Shipment/pickup_detail/PickupDetail.dart';

class PackageDetail extends StatefulWidget {
  @override
  _PackageDetailState createState() => _PackageDetailState();
}

class _PackageDetailState extends State<PackageDetail> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _packageWeight = TextEditingController();
  TextEditingController _packageLength = TextEditingController();
  TextEditingController _packageWidth = TextEditingController();
  TextEditingController _packageHeight = TextEditingController();
  TextEditingController _packageQuantity = TextEditingController();
  TextEditingController _packageItemType = TextEditingController();
  TextEditingController _packageTitle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Package Detail'),
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Text(
                'Fill up this form',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
              ),
              Row(
                children: <Widget>[
                  Text('package weight(Grams)'),
                  Text(
                    ' *',
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
              ),
              TextField(
                  style: TextStyle(color: Colors.black),
                  controller: _packageWeight,
                  enableInteractiveSelection: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintText: 'Enter Package Weight (Grams)',
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    counterText: "",
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
              ),
              Row(
                children: <Widget>[
                  Text('Package Length(CM)'),
                  Text(
                    ' *',
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
              ),
              TextField(
                  style: TextStyle(color: Colors.black),
                  controller: _packageLength,
                  enableInteractiveSelection: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintText: 'Enter Package length (in cm)',
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    counterText: "",
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
              ),
              Row(
                children: <Widget>[
                  Text('Package Width(CM)'),
                  Text(
                    ' *',
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
              ),
              TextField(
                  style: TextStyle(color: Colors.black),
                  controller: _packageWidth,
                  enableInteractiveSelection: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintText: 'Enter Package Width (in cm)',
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    counterText: "",
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
              ),
              Row(
                children: <Widget>[
                  Text('Package Height(CM)'),
                  Text(
                    ' *',
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
              ),
              TextField(
                  style: TextStyle(color: Colors.black),
                  controller: _packageHeight,
                  enableInteractiveSelection: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintText: 'Enter Package Height (in cm)',
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    counterText: "",
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
              ),
              Row(
                children: <Widget>[
                  Text('Package Quantity'),
                  Text(
                    ' *',
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
              ),
              TextField(
                  style: TextStyle(color: Colors.black),
                  controller: _packageQuantity,
                  enableInteractiveSelection: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintText: 'Enter Package Quantity',
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    counterText: "",
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
              ),
              Row(
                children: <Widget>[
                  Text('Package Item type'),
                  Text(
                    ' *',
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
              ),
              TextField(
                  style: TextStyle(color: Colors.black),
                  controller: _packageItemType,
                  enableInteractiveSelection: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintText: 'Type of Item Ex:Glass, Clothes, Electronics',
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    counterText: "",
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
              ),
              Row(
                children: <Widget>[
                  Text('Package Description'),
                  Text(
                    ' *',
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
              ),
              TextField(
                  style: TextStyle(color: Colors.black),
                  controller: _packageTitle,
                  enableInteractiveSelection: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintText: 'Package title',
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    counterText: "",
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
              ),
              RaisedButton(
                onPressed: _onButtonClicked,
                child: Text('Picker Details'),
              )
            ],
          )),
    );
  }

  void _onButtonClicked() async {
    // validate
    String length = _packageLength.text.trim();
    String weight = _packageWeight.text.trim();
    String width = _packageWidth.text.trim();
    String height = _packageHeight.text.trim();
    String quantity = _packageQuantity.text.trim();
    String itemType = _packageItemType.text.trim();
    String title = _packageTitle.text.trim();
    if (weight.isEmpty) {
      showSnackBarMessage("Please enter weight", _scaffoldKey);
    } else if (length.isEmpty) {
      showSnackBarMessage("Please enter length", _scaffoldKey);
    } else if (height.isEmpty) {
      showSnackBarMessage("Please enter height", _scaffoldKey);
    } else if (width.isEmpty) {
      showSnackBarMessage("Please enter width", _scaffoldKey);
    } else if (quantity.isEmpty) {
      showSnackBarMessage("Please enter quantity", _scaffoldKey);
    } else if (itemType.isEmpty) {
      showSnackBarMessage("Please enter item type", _scaffoldKey);
    } else if (title.isEmpty) {
      showSnackBarMessage("Please enter password", _scaffoldKey);
    } else {
      //call API
      //Future<LoginRes> fres = loginVM.callLoginAPI(email, password);
      // LoginRes res = await loginVM.callLoginAPI(email, password);
      // if (!res.status) {
      //   showSnackBarMessage("Wrong email or password", _scaffoldKey);
      //   return;
    }
    // send to Home Page
    Navigator.push(
      context,
      MaterialPageRoute(
          settings: RouteSettings(name: ROUTE_PICKUPDETAIL),
          builder: (context) => PickupDetail()),
    );
  }
}
