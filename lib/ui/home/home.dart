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
import 'package:flutter/services.dart';
import 'package:eunimart/ui/login/login.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AAASingleton appSingleton = AAASingleton();

  int _selectedIndex = 0;

  Widget cusText = Text('Welcome');

  final List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    Orders(),
    Payments(),
    Logistics(),
    HelpScreen()
  ];

  void _onItemTapped(int index) {
    if (index == 0) {
      setState(() {
        this.cusText = Text('Welcome');
      });
      // appSingleton.home = Text('Welcome');
    }
    if (index == 1) {
      setState(() {
        this.cusText = Text('Orders');
      });
      appSingleton.home = Text('Orders');
    }
    if (index == 2) {
      setState(() {
        this.cusText = Text('Payments');
      });
      // appSingleton.home = Text('Payments');
    }
    if (index == 3) {
      setState(() {
        this.cusText = Text('Logistics');
      });
      // appSingleton.home = Text('Logistics');
    }
    if (index == 4) {
      setState(() {
        this.cusText = Text('Help');
      });
      // appSingleton.home = Text('Help');
    }

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 10,
          title: this.cusText,
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
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${appSingleton.dark ? 'Dark Mode' : 'Light Mode'}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                trailing: appSingleton.dark
                    ? Icon(Icons.brightness_4)
                    : Icon(
                        Icons.brightness_7,
                        color: Colors.yellow,
                      ),
                onTap: () {
                  appSingleton.dark = !appSingleton.dark;
                  setState(() {});
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
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text('Logout'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Text('Are you sure you want to logout '),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RaisedButton(
                                        color: Colors.red,
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'No',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      RaisedButton(
                                        color: Colors.green,
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  settings: RouteSettings(
                                                      name: ROUTE_SUBSCRIPTION),
                                                  builder: (context) =>
                                                      Login()));
                                        },
                                        child: Text('Yes',
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ));
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.kitchen),
              title: Text('Orders'),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.credit_card),
              title: Text('Payments'),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.add_shopping_cart),
              title: Text('Logistics'),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.contact_phone),
              title: Text('Help'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
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
