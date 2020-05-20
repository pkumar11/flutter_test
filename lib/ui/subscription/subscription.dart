import 'package:flutter/material.dart';
import 'package:eunimart/ui/subscription/Profile/profile.dart';
import 'package:eunimart/ui/subscription/kyc/kyc.dart';
import 'package:eunimart/ui/subscription/logistics/logistics.dart';

class Subscription extends StatefulWidget {
  @override
  _SubscriptionState createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  @override
  void initState() {
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
                Tab(
                  text: 'Profile',
                ),
                Tab(
                  text: 'Kyc',
                ),
                Tab(
                  text: 'Logistics',
                ),
                Tab(text: 'plan info'),
                Tab(text: 'Change Password ')
              ],
            ),
            title: Text('Profile'),
          ),
          body: TabBarView(
            children: [
              Profile(),
              Kyc(),
              Logistics(),
              Icon(Icons.directions_bike),
              Container(
                // color: Colors.green,
                height: 50,
                margin: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('New password'),
                    SizedBox(
                      height: 10,
                    ),
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
                    SizedBox(
                      height: 10,
                    ),
                    Divider(),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Retype password'),
                    SizedBox(
                      height: 10,
                    ),
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
                    SizedBox(
                      height: 15,
                    ),
                    RaisedButton(
                      child: Text('Submit'),
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
