import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:date_format/date_format.dart';

final a = [Icons.image, Icons.image];
List<File> imagenesF = new List<File>();
int _control = 0;
String _fecha = "";
File _imagen;
TextEditingController _ifdc = new TextEditingController();
final picker = ImagePicker();

class PageAgregarDos extends StatefulWidget {
  PageAgregarDos({Key key}) : super(key: key);

  @override
  _PageAgregarDosState createState() => _PageAgregarDosState();
}

class _PageAgregarDosState extends State<PageAgregarDos> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          horizontalView(),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: _agregarFoto(context),
          ),
          _inputs(context),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: _guardarTrabajo(context),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _control = 0;
    _fecha = "";
    imagenesF.clear();
    _ifdc.clear();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
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
            return Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 0.3,
                ),
              ),
              width: 200.0,
              // color: Colors.white,
              child: Center(
                child: Icon(
                  b,
                  size: 100,
                  color: Colors.grey[700],
                ),
              ),
            );
          } else {
            final imagen = imagenesF[index];
            return InkWell(
              onTap: () {
                _mostrarImagen(context, imagen, index);
              },
              child: Container(
                width: 200.0,
                color: Colors.grey,
                child: Image.file(
                  imagen,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }
        },
      ),
    );
  }

  int _cantidadImagenes() {
    if (imagenesF.length == 0) {
      _control = 0;
      print("deberia ser 0 ${imagenesF.length}");
      return 2;
    } else {
      print("return ${imagenesF.length}");
      return imagenesF.length;
    }
  }

  Widget _agregarFoto(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Icon(Icons.add_a_photo),
        color: Colors.grey[500],
        textColor: Colors.white,
        shape: StadiumBorder(),
        onPressed: () {
          _mostrarAlert(context);
        },
      ),
    );
  }

  Widget _borrarFotos(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Icon(Icons.delete),
        color: Colors.grey[500],
        textColor: Colors.white,
        shape: StadiumBorder(),
        onPressed: () {
          // _mostrarAlert(context);
          setState(() {
            imagenesF.clear();
          });
        },
      ),
    );
  }

  Widget _guardarTrabajo(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text("Guardar pintura"),
        color: Color.fromRGBO(245, 38, 0, 1),
        textColor: Colors.white,
        shape: StadiumBorder(),
        onPressed: () {
          //Enviar todo a firebase
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
        _crearFecha(context)
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

  Widget _crearFecha(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 0, right: 0, top: 15, bottom: 0),
      width: 280,
      height: 60,
      child: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Color.fromRGBO(255, 38, 0, 1),
        ),
        child: TextField(
          // autofocus: true,
          controller: _ifdc,
          enableInteractiveSelection: false,
          decoration: InputDecoration(
            focusColor: Colors.black,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.red, width: 1)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black, width: 0)),
            labelText: 'Fecha.',
            suffixIcon: Icon(Icons.calendar_today),
          ),
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
            _selectDate(context);
          },
        ),
      ),
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2022),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: Theme.of(context).copyWith(
            primaryColor: Color.fromRGBO(255, 38, 0, 1),
            accentColor: Color.fromRGBO(255, 38, 0, 1),
            colorScheme: ColorScheme.light(
              primary: Color.fromRGBO(255, 38, 0, 1),
            ),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _fecha = formatDate(picked, [dd, '-', M, '-', yyyy]).toString();
        _ifdc.text = _fecha;
      });
    }
  }

  void _mostrarImagen(BuildContext context, File imagen, int index) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Card(
                child: Column(
                  children: [
                    Image.file(imagen),
                    Container(
                      child: RaisedButton(
                        child: Icon(Icons.delete),
                        color: Color.fromRGBO(255, 38, 0, 1),
                        textColor: Colors.white,
                        shape: StadiumBorder(),
                        onPressed: () {
                          setState(() {
                            print(imagenesF.length);
                            imagenesF.removeAt(index);
                            print(imagenesF.length);
                            Navigator.pop(context);
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
