import 'package:flutter/material.dart';
import 'package:eunimart/ui/subscription/kyc/kyc_vm.dart';
import 'package:eunimart/app_models.dart';
import 'package:eunimart/ui/error/error.dart';
import 'package:eunimart/util/app_constants.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/services.dart';

class Kyc extends StatefulWidget {
  @override
  _KycState createState() => _KycState();
}

class _KycState extends State<Kyc> {
  KycVM kycVm = KycVM();
  Future<KycRes> mF;
  @override
  void initState() {
    super.initState();
    mF = kycVm.getKycData();
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController aadharCard = TextEditingController();
  TextEditingController passport = TextEditingController();
  TextEditingController bussinessregistration = TextEditingController();
  TextEditingController iec = TextEditingController();
  TextEditingController pancard = TextEditingController();
  TextEditingController voter = TextEditingController();
  TextEditingController gstin = TextEditingController();

  double showPancard = 0;

  bool status = false;

  File _imageFile;
  dynamic _pickImageError;
  String _retrieveDataError;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _imageFile = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        body: FutureBuilder(
            initialData: null,
            future: mF,
            builder: (context, snap) => _checkAPIData(context, snap)));
  }

  Widget _checkAPIData(BuildContext c, AsyncSnapshot snap) {
    //ConnectionState.active = snap.connectionState
    if (snap.hasData) {
      // API
      // 404
      // catch
      KycRes _d = snap.data;
      // status = _d.status;

      if (_d.status) {
        // API true
        return _buildList(c, _d);
      } else if (_d.is_loading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Scaffold(
          backgroundColor: Colors.white,
          //backgroundColor: Theme.of(context).primaryColor,
//          appBar: AppBarr(),
          body: Err(
              bar_visibility: false,
              p_title: 'Kyc',
              m: _d.message,
              mL: () => setState(() {
                    _d.is_loading = true;
                    mF = kycVm.getKycData();
                  })),
        );
      }
    } else {
      // initial loading
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  Widget _buildList(BuildContext c, KycRes res) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    print('${res.data.aadharCardNumber}');
    aadharCard = TextEditingController(text: res.data.aadharCardNumber);
    passport = TextEditingController(text: res.data.passportNumber);
    gstin = TextEditingController(text: res.data.gstinNumber);
    iec = TextEditingController(text: res.data.iecNumber);
    voter = TextEditingController(text: res.data.voterIdNumber);
    pancard = TextEditingController(text: res.data.pancardNumber);
    bussinessregistration =
        TextEditingController(text: res.data.bussinessRegistration);

    return Container(
      margin: EdgeInsets.all(20),
      child: ListView(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 1.0,
                color: Colors.black,
              ),
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
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: GAP_LARGE),
            child: Column(
              children: <Widget>[
                Text('Aadhar card',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
                ),
                TextField(
                    style: TextStyle(color: Colors.black),
                    controller: aadharCard,
                    enableInteractiveSelection: false,
                    keyboardType: TextInputType.number,
                    readOnly: res.data.aadharCardNumber.isEmpty ? false : true,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: 'Aadhar card',
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      counterText: "",
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          child: Text('Upload'),
                        ),
                        Icon(Icons.file_upload),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          child: Text('Download'),
                        ),
                        Icon(
                          Icons.file_download,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 1.0,
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: GAP_LARGE),
            child: Column(
              children: <Widget>[
                Text('Passport',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
                ),
                TextField(
                    style: TextStyle(color: Colors.black),
                    controller: passport,
                    enableInteractiveSelection: false,
                    keyboardType: TextInputType.text,
                    readOnly: res.data.passportNumber.isEmpty ? false : true,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: 'Passport Number',
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      counterText: "",
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          child: Text('Upload'),
                        ),
                        Icon(Icons.file_upload),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          child: Text('Download'),
                        ),
                        Icon(
                          Icons.file_download,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 1.0,
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: GAP_LARGE),
            child: Column(
              children: <Widget>[
                Text('I.E.C. Number',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
                ),
                TextField(
                    style: TextStyle(color: Colors.black),
                    controller: iec,
                    enableInteractiveSelection: false,
                    keyboardType: TextInputType.number,
                    readOnly: res.data.iecNumber.isEmpty ? false : true,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: 'IEC Number',
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      counterText: "",
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          child: Text('Upload'),
                        ),
                        Icon(Icons.file_upload),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          child: Text('Download'),
                        ),
                        Icon(
                          Icons.file_download,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 1.0,
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: GAP_LARGE),
            child: Column(
              children: <Widget>[
                Text('Business Registration',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
                ),
                TextField(
                    style: TextStyle(color: Colors.black),
                    controller: bussinessregistration,
                    enableInteractiveSelection: false,
                    keyboardType: TextInputType.number,
                    readOnly:
                        res.data.bussinessRegistration.isEmpty ? false : true,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: 'Business Registration',
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      counterText: "",
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          child: Text('Upload'),
                        ),
                        Icon(Icons.file_upload),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          child: Text('Download'),
                        ),
                        Icon(
                          Icons.file_download,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 1.0,
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: GAP_LARGE),
            child: Column(
              children: <Widget>[
                Text('GSTIN Number',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
                ),
                TextField(
                    style: TextStyle(color: Colors.black),
                    controller: gstin,
                    enableInteractiveSelection: false,
                    keyboardType: TextInputType.number,
                    readOnly: res.data.gstinNumber.isEmpty ? false : true,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: 'Gstin Number',
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      counterText: "",
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          child: Text('Upload'),
                        ),
                        Icon(Icons.file_upload),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          child: Text('Download'),
                        ),
                        Icon(
                          Icons.file_download,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 1.0,
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: GAP_LARGE),
            child: Column(
              children: <Widget>[
                Text('Voter Number',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
                ),
                TextField(
                    style: TextStyle(color: Colors.black),
                    controller: voter,
                    enableInteractiveSelection: false,
                    keyboardType: TextInputType.number,
                    readOnly: res.data.voterIdNumber.isEmpty ? false : true,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: 'Voter Number',
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      counterText: "",
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          child: Text('Upload'),
                        ),
                        Icon(Icons.file_upload),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          child: Text('Download'),
                        ),
                        Icon(
                          Icons.file_download,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 1.0,
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: GAP_LARGE),
            child: Column(
              children: <Widget>[
                Text('Pancard Number',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
                ),
                TextField(
                    style: TextStyle(color: Colors.black),
                    controller: pancard,
                    enableInteractiveSelection: false,
                    keyboardType: TextInputType.number,
                    readOnly: res.data.pancardNumber.isEmpty ? false : true,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: 'Pancard Number',
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      counterText: "",
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () async {
                            _imageFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery,
                            );
                            setState(() {
                              showPancard = 1;
                            });
                          },
                          child: Text('Upload'),
                        ),
                        Icon(Icons.file_upload),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          child: Text('Download'),
                        ),
                        Icon(
                          Icons.file_download,
                        ),
                      ],
                    )
                  ],
                ),
                Opacity(
                  opacity: showPancard,
                  child: showPancard == 1
                      ? Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text('Preview'),
                                Platform.isAndroid
                                    ? FutureBuilder<void>(
                                        future: retrieveLostData(),
                                        builder: (BuildContext context,
                                            AsyncSnapshot<void> snapshot) {
                                          switch (snapshot.connectionState) {
                                            case ConnectionState.none:
                                            case ConnectionState.waiting:
                                              // return const Text(
                                              //   'You have not yet picked an image.',
                                              //   textAlign: TextAlign.center,
                                              // );
                                              return CircleAvatar(
                                                  radius: 45,
                                                  backgroundColor: Colors.grey,
                                                  child: Text(
                                                    'No Image',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ));
                                            case ConnectionState.done:
                                              return _previewImage();
                                            default:
                                              if (snapshot.hasError) {
                                                return Text(
                                                  'Pick image error: ${snapshot.error}}',
                                                  textAlign: TextAlign.center,
                                                );
                                              } else {
                                                // return const Text(
                                                //   'You have not yet picked an image.',
                                                //   textAlign: TextAlign.center,
                                                // );
                                                return CircleAvatar(
                                                    radius: 45,
                                                    backgroundColor:
                                                        Colors.grey,
                                                    child: Text(
                                                      'No Image',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ));
                                              }
                                          }
                                        },
                                      )
                                    : (_previewImage()),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                            ),
                            RaisedButton(
                              onPressed: () {},
                              child: Text('Submit'),
                            )
                          ],
                        )
                      : Container(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _previewImage() {
    final Text retrieveError = _getRetrieveErrorWidget();
    print('$_imageFile');
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_imageFile != null) {
      return CircleAvatar(
        radius: 45,
        backgroundImage: FileImage(_imageFile),
        // child: _previewImage(),
      );
      // return Image.file(_imageFile);
    } else if (_pickImageError != null) {
      return Text(
        'Pick image error: $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          child: Text(
            'No Image',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ));
    }
  }

  Text _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await ImagePicker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      if (response.type == RetrieveType.video) {
      } else {
        setState(() {
          _imageFile = response.file;
        });
      }
    } else {
      _retrieveDataError = response.exception.code;
    }
  }
}
