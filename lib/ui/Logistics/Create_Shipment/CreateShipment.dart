import 'package:flutter/material.dart';
import 'package:eunimart/ui/Logistics/Create_Shipment/CreateShipment_vm.dart';
import 'package:eunimart/app_models.dart';
import 'package:eunimart/ui/error/error.dart';
import 'package:eunimart/singleton/AAASingleton.dart';

import 'dart:io';
import 'dart:async';

class CreateShipment extends StatefulWidget {
  @override
  _CreateShipmentState createState() => _CreateShipmentState();
}

class _CreateShipmentState extends State<CreateShipment> {

 ListWarehouseAddressVm createShipmentVm =ListWarehouseAddressVm();
  Future<ListWarehouseAddressRes> mF;
  @override
  void initState() {
    super.initState();
    mF= createShipmentVm.getWarehouseAddressData();
    
  }
    final _scaffoldKey = GlobalKey<ScaffoldState>();
bool checkboxValue=false;
  AAASingleton appSingleton = AAASingleton();

   @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.white,
        key: _scaffoldKey,
        appBar: AppBar(title: Text('Select Shipper Address'),),
        body: FutureBuilder(
            initialData: null,
            future: mF,
            builder: (context, snap) => _checkAPIData(context, snap)));
  }

  Widget _checkAPIData(BuildContext c, AsyncSnapshot snap) {
    //ConnectionState.active = snap.connectionState
    if (snap.hasData) {
      // API
      // 404
      // catch
      ListWarehouseAddressRes _d = snap.data;
    //  var status = _d.status;

      if (_d.status) {
        // API true
        return _buildList(c, _d);
      } else if (_d.is_loading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Scaffold(
          // backgroundColor: Colors.white,
          //backgroundColor: Theme.of(context).primaryColor,
//          appBar: AppBarr(),
          body: Err(
              bar_visibility: false,
              p_title: 'Select Shipper Address',
              m: _d.message,
              mL: () => setState(() {
                    _d.is_loading = true;
                    mF = createShipmentVm.getWarehouseAddressData();
                  })),
        );
      }
    } else {
      // initial loading
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

    Widget _buildList(BuildContext c, ListWarehouseAddressRes res) {
    // final w = MediaQuery.of(context).size.width;
    // final h = MediaQuery.of(context).size.height;
    
    // print('===>${res.data[0].id}');
    
    return Container(
      alignment: Alignment.center,
      child:res.data.length>1?
      
      ListView.builder(
        itemCount: res.data.length,
     
        itemBuilder: (context,index){ 

return Container(
            // height: h/3,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
           decoration: BoxDecoration(
            //  color: Colors.black,
        border: Border.all(
          width: 1.0,
          color: Colors.black,
        ),
      ),
            child: Column(children: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                
Checkbox(value: checkboxValue,

onChanged: (value) {print('${res.data[index].address_id}');
print('${res.data[index].id}');
print('$value');

setState(() {
  checkboxValue=value;
});

} ),

              ],),
      
          Row(        mainAxisAlignment: MainAxisAlignment.spaceAround,
children: <Widget>[
            Text('Name'),
Text('${res.data[index].address_name}'),
          ],),
          Padding(padding: EdgeInsets.symmetric(vertical:5),),
//            Row(        mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: <Widget>[
//            Flexible(child:  Text('Address line 1'),flex: 2,),
//             Flexible(fit: FlexFit.loose,
//             // flex: 2,
//                           child:Text('${res.data[index].address_1}'),
// )
//           ],),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
            Text('City'),
Text('${res.data[index].origin_country}'),
          ],),  
          Row(        mainAxisAlignment: MainAxisAlignment.spaceAround,
children: <Widget>[
    Flexible(child: Text('State'),flex:1),
Flexible(child:  Text('${res.data[index].state}'),flex: 5,),
          ],),  
          Row(        mainAxisAlignment: MainAxisAlignment.spaceAround,
children: <Widget>[
            Text('postal Code'),
Text('${res.data[index].postal_code}'),
          ],), 
             Row(        mainAxisAlignment: MainAxisAlignment.spaceAround,
children: <Widget>[
            Text('phone'),
Text('${res.data[index].phone}'),
          ],),   
          SizedBox(height: 10,)   

          ],),);
      
      },)
      :
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Text('No data found'),
        SizedBox(height: 20,),
        RaisedButton(onPressed: (){},
        child: Text('Add new shipper address'),)
      ],)
      );}
    
}