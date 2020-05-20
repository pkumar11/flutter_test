import 'package:eunimart/ui/subscription/Profile/profile_vm.dart';
import 'package:flutter/material.dart';
import 'package:eunimart/app_models.dart';
import 'package:eunimart/ui/error/error.dart';
// import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ProflieVM profileVm = ProflieVM();
  Future<ProfileRes> mF;
  @override
  void initState() {
    super.initState();
    mF = profileVm.getProfileData();
  }

  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool status = false;
  File _image;
  File _imageFile;
  dynamic _pickImageError;
  String _retrieveDataError;

  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  void _onImageButtonPressed(ImageSource source, {BuildContext context}) async {
    await _displayPickImageDialog(context,
        (double maxWidth, double maxHeight, int quality) async {
      try {
        _imageFile = await ImagePicker.pickImage(
            source: source,
            maxWidth: maxWidth,
            maxHeight: maxHeight,
            imageQuality: quality);
        setState(() {});
      } catch (e) {
        _pickImageError = e;
      }
    });
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

  Widget _previewImage() {
    final Text retrieveError = _getRetrieveErrorWidget();
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
          radius: 45,
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
      ProfileRes _d = snap.data;
      status = _d.status;

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
              p_title: 'Profile',
              m: _d.message,
              mL: () => setState(() {
                    _d.is_loading = true;
                    mF = profileVm.getProfileData();
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

  Widget _buildList(BuildContext c, ProfileRes res) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    _firstName = TextEditingController(text: '${res.data.first_name}');
    _lastName = TextEditingController(text: '${res.data.last_name}');

    print(res.data.first_name);

    return Container(
      margin: EdgeInsets.all(10),

      // alignment: Alignment.center,
      height: h / 1.2,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: Colors.black,
        ),
      ),
      // color: Colors.blue,

      padding: EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          Center(
            child: Platform.isAndroid
                ? FutureBuilder<void>(
                    future: retrieveLostData(),
                    builder:
                        (BuildContext context, AsyncSnapshot<void> snapshot) {
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
                                    fontWeight: FontWeight.bold),
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
                                backgroundColor: Colors.grey,
                                child: Text(
                                  'No Image',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ));
                          }
                      }
                    },
                  )
                : (_previewImage()),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () {
                    _onImageButtonPressed(ImageSource.gallery,
                        context: context);
                  },
                  heroTag: 'image0',
                  tooltip: 'Pick Image from gallery',
                  child: const Icon(Icons.photo_library),
                ),
                FloatingActionButton(
                  onPressed: () {
                    _onImageButtonPressed(ImageSource.camera, context: context);
                  },
                  heroTag: 'image1',
                  tooltip: 'Take a Photo',
                  child: const Icon(Icons.camera_alt),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text('First Name'),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: w / 2,
                        // color: Colors.blue,
                        child: TextField(
                            style: TextStyle(color: Colors.black),
                            controller: _firstName,
                            enableInteractiveSelection: false,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              hintText: 'First Name',
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blueAccent,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              counterText: "",
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Text('Last Name'),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: w / 2,
                        // color: Colors.blue,
                        child: TextField(
                            style: TextStyle(color: Colors.black),
                            controller: _lastName,
                            enableInteractiveSelection: false,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              hintText: 'Last Name',
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blueAccent,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              counterText: "",
                            )),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('DOB'),
                  SizedBox(
                    width: 20,
                  ),
                  Text('${res.data.date_of_birth}'),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Text('Gender'),
                  SizedBox(
                    width: 50,
                  ),
                  Text(res.data.gender == 'M' ? 'Male' : 'Female')
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Text('Designation'),
                  SizedBox(
                    width: 20,
                  ),
                  Text('${res.data.designation}')
                ],
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                onPressed: () {},
                child: Text('Submit'),
              )
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _displayPickImageDialog(
      BuildContext context, OnPickImageCallback onPick) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add optional parameters'),
            content: Column(
              children: <Widget>[
                TextField(
                  controller: maxWidthController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration:
                      InputDecoration(hintText: "Enter maxWidth if desired"),
                ),
                TextField(
                  controller: maxHeightController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration:
                      InputDecoration(hintText: "Enter maxHeight if desired"),
                ),
                TextField(
                  controller: qualityController,
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(hintText: "Enter quality if desired"),
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                  child: const Text('PICK'),
                  onPressed: () {
                    double width = maxWidthController.text.isNotEmpty
                        ? double.parse(maxWidthController.text)
                        : null;
                    double height = maxHeightController.text.isNotEmpty
                        ? double.parse(maxHeightController.text)
                        : null;
                    int quality = qualityController.text.isNotEmpty
                        ? int.parse(qualityController.text)
                        : null;
                    onPick(width, height, quality);
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }
}

typedef void OnPickImageCallback(
    double maxWidth, double maxHeight, int quality);
