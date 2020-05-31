import 'package:flutter/material.dart';
import 'package:eunimart/util/app_constants.dart';
import 'package:eunimart/ui/Logistics/Create_Shipment/ReceiverDetails/ReceiverDetails.dart';

class ShipperDetails extends StatefulWidget {
  @override
  _ShipperDetailsState createState() => _ShipperDetailsState();
}

class _ShipperDetailsState extends State<ShipperDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Shipper Details'),
        ),
        body: Container(
            padding: EdgeInsets.all(GAP_XLARGE),
            child: ListView(
              children: <Widget>[
                Text('Fill up the form',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
                ),
                Row(
                  children: <Widget>[
                    Text('Address line 1'),
                    Text(
                      ' *',
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: GAP_SMALL),
                ),
                TextField(
                  style: TextStyle(color: Colors.black),
                  // controller: _packageTitle,
                  enableInteractiveSelection: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintText: 'Address line 1',
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    counterText: "",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
                ),
                Text('Address line 2'),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: GAP_SMALL),
                ),
                TextField(
                    style: TextStyle(color: Colors.black),
                    // controller: _packageTitle,
                    enableInteractiveSelection: false,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: 'Address Line 2',
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
                  padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
                ),
                Text('Address line 3'),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: GAP_SMALL),
                ),
                TextField(
                    style: TextStyle(color: Colors.black),
                    // controller: _packageTitle,
                    enableInteractiveSelection: false,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: 'Address Line 3',
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
                  padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
                ),
                Row(
                  children: <Widget>[
                    Text('City'),
                    Text(
                      ' *',
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: GAP_SMALL),
                ),
                TextField(
                    style: TextStyle(color: Colors.black),
                    // controller: _packageTitle,
                    enableInteractiveSelection: false,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: 'Enter City Name',
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
                  padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
                ),
                Row(
                  children: <Widget>[
                    Text('Country Code'),
                    Text(
                      ' *',
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: GAP_SMALL),
                ),
                TextField(
                    style: TextStyle(color: Colors.black),
                    // controller: _packageTitle,
                    enableInteractiveSelection: false,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: 'Enter Country Code',
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
                  padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
                ),
                Row(
                  children: <Widget>[
                    Text('Country'),
                    Text(
                      ' *',
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: GAP_SMALL),
                ),
                TextField(
                    style: TextStyle(color: Colors.black),
                    // controller: _packageTitle,
                    enableInteractiveSelection: false,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: 'Enter Country',
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
                  padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
                ),
                Row(
                  children: <Widget>[
                    Text('State'),
                    Text(
                      ' *',
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: GAP_SMALL),
                ),
                TextField(
                    style: TextStyle(color: Colors.black),
                    // controller: _packageTitle,
                    enableInteractiveSelection: false,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: 'Enter State',
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
                  padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
                ),
                Row(
                  children: <Widget>[
                    Text('Name'),
                    Text(
                      ' *',
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: GAP_SMALL),
                ),
                TextField(
                    style: TextStyle(color: Colors.black),
                    // controller: _packageTitle,
                    enableInteractiveSelection: false,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: 'Enter Name',
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
                  padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
                ),
                Row(
                  children: <Widget>[
                    Text('Phone Number'),
                    Text(
                      ' *',
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: GAP_SMALL),
                ),
                TextField(
                    style: TextStyle(color: Colors.black),
                    // controller: _packageTitle,
                    enableInteractiveSelection: false,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: 'Enter Phone Number',
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
                  padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
                ),
                Row(
                  children: <Widget>[
                    Text('Email Id'),
                    Text(
                      ' *',
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: GAP_SMALL),
                ),
                TextField(
                    style: TextStyle(color: Colors.black),
                    // controller: _packageTitle,
                    enableInteractiveSelection: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: 'Enter Email Id',
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
                  padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
                ),
                Row(
                  children: <Widget>[
                    Text('Pincode'),
                    Text(
                      ' *',
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: GAP_SMALL),
                ),
                TextField(
                    style: TextStyle(color: Colors.black),
                    // controller: _packageTitle,
                    enableInteractiveSelection: false,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: 'Enter Pin Code',
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
                  padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
                ),
                Row(
                  children: <Widget>[
                    Text('Receiver Name'),
                    Text(
                      ' *',
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: GAP_SMALL),
                ),
                TextField(
                    style: TextStyle(color: Colors.black),
                    // controller: _packageTitle,
                    enableInteractiveSelection: false,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: 'Enter Receiver Name',
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
                  padding: EdgeInsets.symmetric(vertical: GAP_XLARGE),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          settings: RouteSettings(name: ROUTE_RECEIVERDETAILS),
                          builder: (context) => ReceiverDetails()),
                    );
                  },
                  child: Text('Receivers Details'),
                )
              ],
            )));
  }
}
