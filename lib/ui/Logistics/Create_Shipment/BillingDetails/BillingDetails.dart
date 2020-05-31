import 'package:flutter/material.dart';
import 'package:eunimart/util/app_constants.dart';
import 'package:intl/intl.dart';

class BillingDetails extends StatefulWidget {
  @override
  _BillingDetailsState createState() => _BillingDetailsState();
}

class _BillingDetailsState extends State<BillingDetails> {
  String currency = 'select';
  String dutyApplicable = 'select';
  String orderPaymentType = 'select';
  String taxPaymentType = 'select';
  var datePicked;
  DateTime _dateTime = DateTime.now();

  Future<void> _selectSelectToDate(BuildContext context) async {
    final DateTime datePicked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (context, child) => SingleChildScrollView(
        child: child,
      ),
    );
    if (datePicked != null) {
      setState(() {
        _dateTime = datePicked;
      });
    }
    print(_dateTime);
  }

  @override
  Widget build(BuildContext context) {
    var formatter = DateFormat('yMMMEd');

    return Scaffold(
      appBar: AppBar(
        title: Text('Billing Details'),
      ),
      body: Container(
          padding: EdgeInsets.all(GAP_XLARGE),
          child: ListView(
            children: <Widget>[
              Text('Fill up the form',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
                    fillColor: Colors.white,
                    hintText: 'Enter Order ID',
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
                  Text('Order Received Date'),
                  Text(
                    ' *',
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
              ListTile(
                onTap: () async {
                  _selectSelectToDate(context);
                },
                title: Text(datePicked == null
                    ? '${formatter.format(DateTime.parse(_dateTime.toString()))}'
                    : 'Enter pick up date'),
                trailing: Icon(
                  Icons.calendar_today,
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 12,
                    child: Row(
                      children: [
                        Text('Currency'),
                        Text(
                          ' *  ',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(':'),
                  ),
                  Expanded(
                    flex: 11,
                    child: DropdownButton<String>(
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
                    fillColor: Colors.white,
                    hintText: 'Enter Order Amount',
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
                  Expanded(
                    flex: 12,
                    child: Row(
                      children: [
                        Text('Order Payment Type'),
                        Text(
                          ' *',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(':'),
                  ),
                  Expanded(
                    flex: 11,
                    child: DropdownButton<String>(
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
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 12,
                    child: Row(
                      children: [
                        Text('Duty Applicable'),
                        Text(
                          ' *  ',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(':'),
                  ),
                  Expanded(
                    flex: 11,
                    child: DropdownButton<String>(
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
                    fillColor: Colors.white,
                    hintText: 'Enter Tax Amount',
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
                    fillColor: Colors.white,
                    hintText: 'Enter Duty Amount',
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
                  Expanded(
                    flex: 12,
                    child: Row(
                      children: [
                        Text('Tax Payment type'),
                        Text(
                          ' *',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(':'),
                  ),
                  Expanded(
                    flex: 11,
                    child: DropdownButton<String>(
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
                  )
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
                    fillColor: Colors.white,
                    hintText: 'Enter IEC Number',
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
                    fillColor: Colors.white,
                    hintText: 'Enter GSTIN Number',
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
              Text('HSN code'),
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
                    hintText: 'Enter HSN Code',
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
                  Text('Invoice Number'),
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
                    hintText: 'Enter Invoice Number',
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
                    fillColor: Colors.white,
                    hintText: 'Enter Invoice Amount',
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
              RaisedButton(onPressed: () {}, child: Text('Submit'))
            ],
          )),
    );
  }
}
