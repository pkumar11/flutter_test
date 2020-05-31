import 'package:flutter/material.dart';
import 'package:eunimart/app_models.dart';
import 'package:eunimart/util/app_constants.dart';
import 'package:eunimart/ui/signup/Signup_vm.dart';
import 'package:eunimart/ui/home/home.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String eMAILHINT = "Enter Email";
  String pASSWORDHINT = "Enter Password";
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmpasswordController = TextEditingController();
  bool checkboxValue = false;
  SignupVM signupVM = SignupVM();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // backgroundColor: Color(0xffc7c8c9),
      appBar: AppBar(
        title: Text('Signup'),
      ),
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
                flex: 35,
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
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.start,
                              )
                            ],
                          ),
                        ),
                        Container(
                          // color: Colors.white,
                          child: TextField(
                              autofocus: true,
                              style: TextStyle(color: Colors.black),
                              controller: _emailController,
                              // enableInteractiveSelection: false,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: eMAILHINT,
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
                                  fontSize: 15,
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
                                hintText: pASSWORDHINT,
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
                                ' Confirm Password',
                                style: TextStyle(
                                  fontSize: 15,
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
                              controller: _confirmpasswordController,
                              obscureText: true,
                              enableInteractiveSelection: false,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: pASSWORDHINT,
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
                          padding: EdgeInsets.symmetric(vertical: 5),
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: checkboxValue,
                              // checkColor: Colors.blue,
                              onChanged: (bool newValue) {
                                setState(() {
                                  checkboxValue = !checkboxValue;
                                });
                              },
                            ),
                            Container(
                              child: Flexible(
                                child: Text(
                                    'I agree to the Terms of Service and Privacy Policy.'),
                              ),
                            )
                          ],
                        ),
                        Container(height: GAP_XLARGE),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: RaisedButton(
                              color: Colors.blue,
                              child: Text(
                                'Signup',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              onPressed: () {
                                _onSignupClicked();
                              }),
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

  void _onSignupClicked() async {
    // validate
    String password = _passwordController.text.trim();
    String email = _emailController.text.toLowerCase().trim();
    String cpassword = _confirmpasswordController.text.trim();

    if (email.isNotEmpty) {
      email = email.trim();
      final alphanumeric =
          RegExp(r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$');

      if (alphanumeric.hasMatch(email)) {
        if (password.isEmpty) {
          showSnackBarMessage("Please enter password", _scaffoldKey);
        } else if (password.length < 6) {
          showSnackBarMessage(
              " password should have length of 6", _scaffoldKey);
        } else {
          if (cpassword.isEmpty) {
            showSnackBarMessage("Please enter confirm password", _scaffoldKey);
          } else if (cpassword != password) {
            showSnackBarMessage("Both password should be same", _scaffoldKey);
          } else {
            if (!this.checkboxValue) {
              showSnackBarMessage("please select checkbox", _scaffoldKey);
            } else {
              // call API
              // Future<SignupRes> res = signupVM.callSignupAPI(email, password, cpassword);
              SignupRes res =
                  await signupVM.callSignupAPI(email, password, cpassword);
              if (!res.status) {
                showSnackBarMessage(
                    "This email is already is in use.", _scaffoldKey);
                return;
              }
              // send to Home Page
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      settings: RouteSettings(name: ROUTE_HOME),
                      builder: (context) => Home()));
              // showSnackBarMessage("you are ready for signup", _scaffoldKey);
            }
          }
        }

        // showSnackBarMessage('sucess', _scaffoldKey);
        // response.message = email.toLowerCase().trim();
      } else {
        showSnackBarMessage("Please Enter Valid Mail Id", _scaffoldKey);
      }
    }
  }
}
