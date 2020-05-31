import 'package:flutter/material.dart';
import 'package:eunimart/singleton/AAASingleton.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  AAASingleton appSingleton = AAASingleton();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          child: Icon(Icons.keyboard_backspace),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.ideographic,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Center(
                              child: Container(
                                child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 40,
                                    backgroundImage:
                                        AssetImage('assets/images/vkohli.jpg')),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                              child: Icon(Icons.edit),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 8,
                child: Container(
                  child: Container(
                    height: 50.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade700,
                          ),
                          padding: EdgeInsets.all(15),
                          child: GestureDetector(
                            onTap: _profileData,
                            child: Text(
                              'Profile',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade700,
                          ),
                          padding: EdgeInsets.all(15),
                          child: GestureDetector(
                            child: Text(
                              'Kyc',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade700,
                          ),
                          padding: EdgeInsets.all(15),
                          child: GestureDetector(
                            child: Text(
                              'Plan Info',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade700,
                          ),
                          padding: EdgeInsets.all(15),
                          child: GestureDetector(
                            child: Text(
                              'Logistics',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blue.shade700,
                          ),
                          padding: EdgeInsets.all(15),
                          child: GestureDetector(
                            child: Text(
                              'Change password',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
                            
DefaultTabController(
    length: 3,
child: TabBar(
        tabs: [
          Tab(icon: Icon(Icons.directions_car)),
          Tab(icon: Icon(Icons.directions_transit)),
          Tab(icon: Icon(Icons.directions_bike)),
        ],
      ),
),
 
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileData (){
    print('inside');
return Text('kkkk');
  }
}
