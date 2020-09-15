import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

final a = [Icons.image, Icons.image];
List<File> imagenesF = new List<File>();
int _control = 0;
// FocusNode myFocusNode = new FocusNode();
File _imagen;
final picker = ImagePicker();

class PageAgregarDos extends StatefulWidget {
  PageAgregarDos({Key key}) : super(key: key);

  @override
  _PageAgregarDosState createState() => _PageAgregarDosState();
}

class _PageAgregarDosState extends State<PageAgregarDos> {
  FocusNode myFocusNode;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          horizontalView(),
          _agregarFoto(context),
          _inputs(context),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _control = 0;
    imagenesF.clear();
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    myFocusNode = new FocusNode();
    // _agregarFoto();
  }

  Widget horizontalView() {
    return Container(
      alignment: Alignment.center,
      height: 180.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _cantidadImagenes(),
        itemBuilder: (context, index) {
          if (_control == 0 || _control == 1) {
            final b = a[index];
            _control++;
            print(_control);
            return Container(
              width: 200.0,
              color: Colors.grey,
              child: Center(
                child: Icon(
                  b,
                  size: 100,
                ),
              ),
            );
          } else {
            final imagen = imagenesF[index];
            return Container(
              width: 200.0,
              color: Colors.grey,
              child: Image.file(
                imagen,
                fit: BoxFit.cover,
              ),
            );
          }
        },
      ),
    );
  }

  int _cantidadImagenes() {
    if (imagenesF.length == 0) {
      return 2;
    } else {
      return imagenesF.length;
    }
  }

  Widget _agregarFoto(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Icon(Icons.add_a_photo),
        color: Color.fromRGBO(205, 38, 0, 1),
        textColor: Colors.white,
        shape: StadiumBorder(),
        onPressed: () {
          _mostrarAlert(context);
        },
      ),
    );
  }

  void _mostrarAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text(
            'Foto',
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  getImage();
                  Navigator.pop(context);
                },
                child: Card(
                  child: Row(
                    children: [
                      FlatButton(
                        child: Icon(
                          Icons.camera_alt,
                          color: Color.fromRGBO(205, 38, 0, 1),
                        ),
                        shape: StadiumBorder(),
                      ),
                      Text(
                        'Camara',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  getImageGal();
                  Navigator.pop(context);
                },
                child: Card(
                  child: Row(
                    children: [
                      FlatButton(
                        child: Icon(
                          Icons.slideshow,
                          color: Color.fromRGBO(205, 38, 0, 1),
                        ),
                        shape: StadiumBorder(),
                      ),
                      Text(
                        'Galeria',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Future getImage() async {
    PickedFile pick = await picker.getImage(source: ImageSource.camera);
    setState(() {
      _imagen = File(pick.path);
      imagenesF.add(_imagen);
    });
  }

  Future getImageGal() async {
    PickedFile pick = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _imagen = File(pick.path);
      imagenesF.add(_imagen);
    });
  }

  Widget _inputs(BuildContext context) {
    return Column(
      children: [
        _inputDireccion(context),
        _inputExtra(context),
      ],
    );
  }

  Widget _inputDireccion(BuildContext context) {
    return Container(
      // duration: Duration(milliseconds: 10000),
      // curve: Curves.fastLinearToSlowEaseIn,
      padding: EdgeInsets.only(left: 0, right: 0, top: 15, bottom: 0),
      width: 280,
      height: 60,
      child: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Color.fromRGBO(255, 38, 0, 1),
        ),
        child: TextField(
          // autofocus: true,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            focusColor: Colors.black,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.red, width: 1)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black, width: 0)),
            // counter: Text('Letras ${_nombre.length}'),
            // hintText: 'Direccion',
            labelText: 'Direccion',
            suffixIcon: Icon(
              Icons.gps_fixed,
              // color: Color.fromRGBO(255, 38, 0, 1),
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputExtra(BuildContext context) {
    return Container(
      // duration: Duration(milliseconds: 10000),
      // curve: Curves.fastLinearToSlowEaseIn,
      padding: EdgeInsets.only(left: 0, right: 0, top: 15, bottom: 0),
      width: 280,
      height: 60,
      child: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Color.fromRGBO(255, 38, 0, 1),
        ),
        child: TextField(
          focusNode: myFocusNode,
          // autofocus: true,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            focusColor: Colors.black,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.red, width: 1)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black, width: 0)),
            // counter: Text('Letras ${_nombre.length}'),
            // hintText: 'Extra',
            labelText: 'Barrio, conjunto, etc.',
            // labelStyle: TextStyle(
            //   color: Colors.amber,
            // ),
            suffixIcon: Icon(
              Icons.home,
              // color: Color.fromRGBO(255, 38, 0, 1),
            ),
          ),
        ),
      ),
    );
  }
}
