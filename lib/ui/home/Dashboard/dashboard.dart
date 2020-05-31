import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(children: <Widget>[dashboardTitle('Essential details')]),
                Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: _dashboardTiles('Revenue', 0xfff5496a),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: _dashboardTiles('Orders', 0xff3fcdce),
                      )
                    ]),
                Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: _dashboardTiles('Shipped Orders', 0xff1f88e5),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: _dashboardTiles('Skus Sold', 0xfffcac4b),
                      )
                    ]),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: <Widget>[dashboardTitle('Necessary details')],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: _secondMenuTiles('Revenue'),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(child: _secondMenuTiles('Orders'))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: _secondMenuTiles('Revenue'),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(child: _secondMenuTiles('Orders'))
                  ],
                ),
              ],
            ),
          ],
        ));
  }

  Widget dashboardTitle(String title) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
        decoration: BoxDecoration(
          color: Color(0xff2872ba),
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(5),
              topRight: Radius.circular(5),
              topLeft: Radius.circular(5),
              bottomLeft: Radius.circular(5)),
        ),
        alignment: Alignment.center,
        child: Text('$title',
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w400)),
      ),
    );
  }

  Widget _dashboardTiles(String title, int bgColor) {
    return Container(
      padding: EdgeInsets.only(top: 10.0),

      // width: MediaQuery.of(context).size.width * 0.5,
      // height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      // child: Flexible(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(bgColor),
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(5),
              topRight: Radius.circular(5),
              topLeft: Radius.circular(5),
              bottomLeft: Radius.circular(5)),
        ),
        child: Column(children: <Widget>[
          Text(
            '$title',
            style: TextStyle(fontSize: 18),
          ),
          Row(
            children: <Widget>[
              Text(
                '₹',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: 5,
              ),
              Text('0')
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text('0% since last used')
        ]),
      ),
      // ),
    );
  }

  Widget _secondMenuTiles(String title) {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      width: MediaQuery.of(context).size.width * 0.4,
      // height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white),
      // child: Flexible(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(5), bottomLeft: Radius.circular(5)),
        ),
        child: Column(children: <Widget>[
          Text(
            'Today\'s $title',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          Row(
            children: <Widget>[
              Text(
                '₹',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              SizedBox(
                width: 5,
              ),
              Text('0')
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '0% ',
            style: TextStyle(color: Colors.black),
          )
        ]),
      ),
      // ),
    );
  }
}
