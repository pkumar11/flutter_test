import 'package:flutter/material.dart';
import 'package:eunimart/singleton/AAASingleton.dart';
import 'package:eunimart/ui/profile/profile.dart';
import 'package:eunimart/util/app_constants.dart';
import 'package:eunimart/ui/subscription/subscription.dart';
import 'package:eunimart/ui/orders/Orders.dart';
import 'package:eunimart/ui/Payments/payments.dart';
import 'package:eunimart/ui/Logistics/Logistics.dart';
import 'package:eunimart/ui/home/Dashboard/dashboard.dart';
import 'package:eunimart/ui/Help/Help.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AAASingleton appSingleton = AAASingleton();

  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    Orders(),
    Payments(),
    Logistics(),
    HelpScreen()
  ];

  void _onItemTapped(int index) {
    if (index == 0) {
      appSingleton.home = "Welcome";
    }
    if (index == 1) {
      appSingleton.home = "Orders";
    }
    if (index == 2) {
      appSingleton.home = "Payments";
    }
    if (index == 3) {
      appSingleton.home = "Logistics";
    }
    if (index == 4) {
      appSingleton.home = "Help";
    }

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${appSingleton.home}"),
        ),
        backgroundColor: Color(0xffc7c8c9),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Container(
                    child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close,
                          )),
                    ),
                    Container(
                      child: Center(
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 35,
                            backgroundImage:
                                AssetImage('assets/images/vkohli.jpg')),
                      ),
                    ),
                  ],
                )),
              ),
              ListTile(
                title: Row(
                  // crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: <Widget>[
                    Icon(Icons.person),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          settings: RouteSettings(name: ROUTE_PROFILE),
                          builder: (context) => Profile()));
                },
              ),
              ListTile(
                title: Row(
                  // crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: <Widget>[
                    Icon(Icons.event_note),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Subscription',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          settings: RouteSettings(name: ROUTE_SUBSCRIPTION),
                          builder: (context) => Subscription()));
                },
              ),
              ListTile(
                title: Row(
                  // crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: <Widget>[
                    Icon(Icons.exit_to_app),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Logout',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.kitchen),
              title: Text('Orders'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.credit_card),
              title: Text('Payments'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart),
              title: Text('Logistics'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contact_phone),
              title: Text('Help'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue.shade500,
          // showSelectedLabels: true,
          showUnselectedLabels: true,
          // selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
        body: _widgetOptions[_selectedIndex]);
  }

  void _goToProfilePage() {
    // appSingleton.home = "Pankaj";
    Navigator.push(
        context,
        MaterialPageRoute(
            settings: RouteSettings(name: ROUTE_PROFILE),
            builder: (context) => Profile()));
  }
}
