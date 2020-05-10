import 'package:flutter/material.dart';

class Subscription extends StatefulWidget {
  @override
  _SubscriptionState createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  @override
  void initState(){
        super.initState();
      
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            
            bottom: TabBar(
isScrollable: true,
              tabs: [
        
                Tab(text: 'Profile',),
                Tab(text: 'Kyc',),
                Tab(text: 'Logistics',),
                Tab(text:'plan info'),
                Tab(text:'Change Password ')
              ],
            ),
            title: Text('Profile'),
          ),
          body: TabBarView(
            children: [
              Icon(Icons.directions_car),
              Container(
                
                // margin: EdgeInsets.all(20),
                // color: Colors.green,
                child: SizedBox(
                  
    // height: 50,
    child: Card(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          ListTile(
            title: Text('1625 Main Street',
                style: TextStyle(fontWeight: FontWeight.w500)),
            subtitle: Text('My City, CA 99984'),
            leading: Icon(
              Icons.restaurant_menu,
              color: Colors.blue[500],
            ),
          ),
          Divider(),
          ListTile(
            title: Text('(408) 555-1212',
                style: TextStyle(fontWeight: FontWeight.w500)),
            leading: Icon(
              Icons.contact_phone,
              color: Colors.blue[500],
            ),
          ),
          ListTile(
            title: Text('costa@example.com'),
            leading: Icon(
              Icons.contact_mail,
              color: Colors.blue[500],
            ),
          ),
        ],
      ),
    ),
  ),
              ),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
                        Container(
                          // color: Colors.green,
                          height:50,
                          margin: EdgeInsets.all(15),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                          Text('New password'),
                          SizedBox(height: 10,),
                           TextField(
                            style: TextStyle(color: Colors.black),
                            // controller: _emailController,
                            enableInteractiveSelection: false,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              fillColor: Colors.grey,
                              hintText: 'enter new password',
                              filled: true,
                              border: InputBorder.none,
                              counterText: "",
                            )),
                                                      SizedBox(height: 10,),

                            Divider(),
                                                      SizedBox(height: 10,),

                            Text('Retype password'),
                                                      SizedBox(height: 10,),

                             TextField(
                            style: TextStyle(color: Colors.black),
                            // controller: _emailController,
                            enableInteractiveSelection: false,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              fillColor: Colors.grey,
                              hintText: 'retype password',
                              filled: true,
                              border: InputBorder.none,
                              counterText: "",
                            )),
                                                      SizedBox(height: 15,),

                            RaisedButton(child: Text('Submit'),
                            onPressed: (){},),
                      
                        ],),)

                      

            ],
          ),
        ),
      ),
    );
  }
}