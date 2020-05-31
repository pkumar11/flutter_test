import 'package:flutter/material.dart';
import 'package:eunimart/app_models.dart';
import 'package:eunimart/ui/home/home.dart';
import 'package:eunimart/ui/login/login_vm.dart';
import 'package:eunimart/util/app_constants.dart';
import 'package:eunimart/ui/signup/Signup.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String EMAIL_HINT = "Enter Email";
  String PASSWORD_HINT = "Enter Password";

  LoginVM loginVM = LoginVM();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // backgroundColor: Color(0xffc7c8c9),

      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 12,
                child: Container(
                  child: Center(
                    child: Image(
                      image: AssetImage(ASSET_LOGO),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 30,
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1),
                      child: Column(children: <Widget>[
                        Container(
                          // padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Email',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.start,
                              )
                            ],
                          ),
                        ),
                        Container(
                          // color: Colors.white,
                          child: TextField(
                              style: TextStyle(color: Colors.black),
                              controller: _emailController,
                              // enableInteractiveSelection: false,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: EMAIL_HINT,
                                filled: true,
                                // enabledBorder: OutlineInputBorder(
                                //   borderSide: BorderSide(
                                //     color: Colors.blueAccent,
                                //   ),
                                //   borderRadius: BorderRadius.circular(10.0),
                                // ),
                                counterText: "",
                              )),
                        ),
                        Container(height: GAP_2XLARGE_GAP),
                        Container(
                          // padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Password',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.start,
                              )
                            ],
                          ),
                        ),
                        Container(
                          // color: Colors.white,
                          child: TextField(
                              style: TextStyle(color: Colors.black),
                              controller: _passwordController,
                              obscureText: true,
                              enableInteractiveSelection: false,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: PASSWORD_HINT,
                                filled: true,
                                // enabledBorder: OutlineInputBorder(
                                //   borderSide: BorderSide(
                                //     color: Colors.blueAccent,
                                //   ),
                                //   borderRadius: BorderRadius.circular(10.0),
                                // ),
                                counterText: "",
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                              child: Text('Forget Password'),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        settings:
                                            RouteSettings(name: ROUTE_SIGNUP),
                                        builder: (context) => Signup()));
                                print('signup clicked');
                              },
                              child: Text('Signup',
                                  style: TextStyle(fontSize: 18)),
                            )
                          ],
                        ),
                        Container(height: GAP_XLARGE),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: RaisedButton(
                            color: Colors.blue,
                            child: Text('Login',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                            onPressed: _onLoginClicked,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                        )
                      ]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onLoginClicked() async {
    // validate
    String password = _passwordController.text.trim();
    String email = _emailController.text.trim();
    if (email.isEmpty) {
      showSnackBarMessage("Please enter email", _scaffoldKey);
    } else if (password.isEmpty) {
      showSnackBarMessage("Please enter password", _scaffoldKey);
    } else {
      //call API
      //Future<LoginRes> fres = loginVM.callLoginAPI(email, password);
      LoginRes res = await loginVM.callLoginAPI(email, password);
      if (!res.status) {
        showSnackBarMessage("Wrong email or password", _scaffoldKey);
        return;
      }
      //send to Home Page
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              settings: RouteSettings(name: ROUTE_HOME),
              builder: (context) => Home()));
    }
  }
}
