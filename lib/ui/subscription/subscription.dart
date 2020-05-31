import 'package:flutter/material.dart';
import 'package:eunimart/ui/subscription/Profile/profile.dart';
import 'package:eunimart/ui/subscription/kyc/kyc.dart';
import 'package:eunimart/ui/subscription/logistics/logistics.dart';
import 'package:eunimart/ui/subscription/planInfo/PlanInfo.dart';

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
              PlanInfo(),
              Container(
                // color: Colors.green,
                // height: 50,
                margin: EdgeInsets.all(15),
                child: ListView(
                  children: <Widget>[
                    Text('New password'),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                        style: TextStyle(color: Colors.black),
                        // controller: pancard,
                        enableInteractiveSelection: false,
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: ' Enter new password',
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueAccent,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
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
                        // controller: pancard,
                        enableInteractiveSelection: false,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: 'Enter confirm password',
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueAccent,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
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
