import 'package:flutter/material.dart';
import 'package:th_app/app_models.dart';
import 'package:th_app/ui/home/home.dart';
import 'package:th_app/ui/login/login_vm.dart';
import 'package:th_app/util/app_constants.dart';

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
      body: Column(
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
            flex: 15,
            child: Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: GAP_3XLARGE_GAP),
                child: Column(children: <Widget>[
                  Container(
                    color: Colors.white,
                    child: TextField(
                        style: TextStyle(color: Colors.black),
                        controller: _emailController,
                        enableInteractiveSelection: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: EMAIL_HINT,
                          filled: true,
                          border: InputBorder.none,
                          counterText: "",
                        )),
                  ),
                  Container(height: GAP_XLARGE),
                  Container(
                    color: Colors.white,
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
                          border: InputBorder.none,
                          counterText: "",
                        )),
                  ),
                  Container(height: GAP_XLARGE),
                  RaisedButton(
                    child: Text('Login'),
                    onPressed: _onLoginClicked,
                  )
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onLoginClicked() async {
    // validate
    String password = _passwordController.text.trim();
    String email =_emailController.text.trim();
    if(email.isEmpty){
      showSnackBarMessage("Please enter email" , _scaffoldKey);
    }else if(password.isEmpty){
      showSnackBarMessage("Please enter password" , _scaffoldKey);
    }else {
      //call API
      //Future<LoginRes> fres = loginVM.callLoginAPI(email, password);
      LoginRes res = await loginVM.callLoginAPI(email, password);
      if(!res.status){
        showSnackBarMessage("Wrong email or password" , _scaffoldKey);
        return;
      }
      //send to Home Page
      Navigator.push(context, MaterialPageRoute(
          settings: RouteSettings(name: ROUTE_HOME),
          builder: (context) => Home()));
    }
  }



}
