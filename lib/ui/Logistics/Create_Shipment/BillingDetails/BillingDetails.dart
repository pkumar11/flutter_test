import 'package:flutter/material.dart';
import 'package:eunimart/util/app_constants.dart';

class BillingDetails extends StatefulWidget {
  @override
  _BillingDetailsState createState() => _BillingDetailsState();
}

class _BillingDetailsState extends State<BillingDetails> {
  String currency = 'select';
  String dutyApplicable = 'select';
  String orderPaymentType = 'select';
  String taxPaymentType = 'select';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Billing Details'),
      ),
      body: Container(
          padding: EdgeInsets.all(GAP_XLARGE),
          child: ListView(
            children: <Widget>[
              Text('Fill up the form'),
              Padding(
                padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
              ),
              Row(
                children: <Widget>[
                  Text('Order Id'),
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
                    fillColor: Colors.grey,
                    hintText: 'Order Id',
                    filled: true,
                    border: InputBorder.none,
                    counterText: "",
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
              ),
              Row(
                children: <Widget>[
                  Text('Order Received Date'),
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
                    fillColor: Colors.grey,
                    hintText: 'Order Received date',
                    filled: true,
                    border: InputBorder.none,
                    counterText: "",
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
              ),
              Row(
                children: <Widget>[
                  Text('Currency'),
                  Text(
                    ' *  ',
                    style: TextStyle(color: Colors.red),
                  ),
                  Text('  :  '),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: GAP_XLARGE),
                  ),
                  DropdownButton<String>(
                    dropdownColor: Colors.white,

                    value: currency,
                    // icon: Icon(Icons.arrow_downward, color: Colors.black),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.black),
                    // underline: Container(
                    //   height: 2,
                    //   color: Colors.blue,
                    // ),
                    onChanged: (String newValue) {
                      setState(() {
                        currency = newValue;
                      });
                    },
                    items: <String>[
                      'select',
                      'USD',
                      'INR',
                      'MXN',
                      'AED',
                      'SGD',
                      'CAD',
                      'THB'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
              ),
              Row(
                children: <Widget>[
                  Text('Order Amount'),
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
                    fillColor: Colors.grey,
                    hintText: 'Order Amount',
                    filled: true,
                    border: InputBorder.none,
                    counterText: "",
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
              ),
              Row(
                children: <Widget>[
                  Text('Order Payment Type'),
                  Text(
                    ' *',
                    style: TextStyle(color: Colors.red),
                  ),
                  Text('  :  '),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: GAP_XLARGE),
                  ),
                  DropdownButton<String>(
                    dropdownColor: Colors.white,

                    value: orderPaymentType,
                    // icon: Icon(Icons.arrow_downward, color: Colors.black),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.black),
                    // underline: Container(
                    //   height: 2,
                    //   color: Colors.blue,
                    // ),
                    onChanged: (String newValue) {
                      setState(() {
                        orderPaymentType = newValue;
                      });
                    },
                    items: <String>['select', 'Prepaid', 'COD']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
              ),
              Row(
                children: <Widget>[
                  Text('Duty Applicable'),
                  Text(
                    ' *  ',
                    style: TextStyle(color: Colors.red),
                  ),
                  Text('  :  '),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: GAP_XLARGE),
                  ),
                  DropdownButton<String>(
                    dropdownColor: Colors.white,

                    value: dutyApplicable,
                    // icon: Icon(Icons.arrow_downward, color: Colors.black),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.black),
                    // underline: Container(
                    //   height: 2,
                    //   color: Colors.blue,
                    // ),
                    onChanged: (String newValue) {
                      setState(() {
                        dutyApplicable = newValue;
                      });
                    },
                    items: <String>['select', 'Yes', 'No']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
              ),
              Text('Tax Amount'),
              Padding(
                padding: EdgeInsets.symmetric(vertical: GAP_SMALL),
              ),
              TextField(
                  style: TextStyle(color: Colors.black),
                  // controller: _packageTitle,
                  enableInteractiveSelection: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: Colors.grey,
                    hintText: 'Order Id',
                    filled: true,
                    border: InputBorder.none,
                    counterText: "",
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
              ),
              Row(
                children: <Widget>[
                  Text('Duty Amount'),
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
                    fillColor: Colors.grey,
                    hintText: 'Order Id',
                    filled: true,
                    border: InputBorder.none,
                    counterText: "",
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
              ),
              Row(
                children: <Widget>[
                  Text('Tax Payment type'),
                  Text(
                    ' *',
                    style: TextStyle(color: Colors.red),
                  ),
                  Text('  :  '),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: GAP_XLARGE),
                  ),
                  DropdownButton<String>(
                    dropdownColor: Colors.white,

                    value: taxPaymentType,
                    // icon: Icon(Icons.arrow_downward, color: Colors.black),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.black),
                    // underline: Container(
                    //   height: 2,
                    //   color: Colors.blue,
                    // ),
                    onChanged: (String newValue) {
                      setState(() {
                        taxPaymentType = newValue;
                      });
                    },
                    items: <String>['select', 'Prepaid', 'COD']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
              ),
              Row(
                children: <Widget>[
                  Text('IEC Number'),
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
                    fillColor: Colors.grey,
                    hintText: 'Order Id',
                    filled: true,
                    border: InputBorder.none,
                    counterText: "",
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
              ),
              Row(
                children: <Widget>[
                  Text('GSTIN Number'),
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
                    fillColor: Colors.grey,
                    hintText: 'Order Id',
                    filled: true,
                    border: InputBorder.none,
                    counterText: "",
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
              ),
              Text('HSN code'),
              Padding(
                padding: EdgeInsets.symmetric(vertical: GAP_SMALL),
              ),
              TextField(
                  style: TextStyle(color: Colors.black),
                  // controller: _packageTitle,
                  enableInteractiveSelection: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: Colors.grey,
                    hintText: 'Order Id',
                    filled: true,
                    border: InputBorder.none,
                    counterText: "",
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
              ),
              Row(
                children: <Widget>[
                  Text('Invoicde Number'),
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
                    fillColor: Colors.grey,
                    hintText: 'Order Id',
                    filled: true,
                    border: InputBorder.none,
                    counterText: "",
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
              ),
              Text('Invoice Amount'),
              Padding(
                padding: EdgeInsets.symmetric(vertical: GAP_SMALL),
              ),
              TextField(
                  style: TextStyle(color: Colors.black),
                  // controller: _packageTitle,
                  enableInteractiveSelection: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: Colors.grey,
                    hintText: 'Order Id',
                    filled: true,
                    border: InputBorder.none,
                    counterText: "",
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: GAP_XLARGE),
              ),
              RaisedButton(onPressed: () {}, child: Text('Submit'))
            ],
          )),
    );
  }
}
