import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatelessWidget {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  Color gradientStart =
      Color.fromRGBO(255, 38, 0, 1); //Change start gradient color here
  Color gradientEnd = Colors.orange[800]; //Change end gradient color here
  String _ltext = "";
  String _lpass = "";
  Color _inIcon = Colors.grey[600];
  Color _inIconSelected = Colors.orange[800];
  final mq = MediaQueryData.fromWindow(window);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.cyan,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 38, 0, .9),
        centerTitle: true,
        title: Stack(
          children: <Widget>[
            // Stroked text as border.
            Text(
              'Welcome',
              style: TextStyle(
                fontSize: 15,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 1
                  ..color = Colors.grey[700],
              ),
            ),
            // Solid text as fill.
            Text(
              'Welcome',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        // height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [gradientStart, gradientEnd],
            begin: const FractionalOffset(0.8, 0.0),
            end: const FractionalOffset(0.0, 0.5),
            // stops: [0.0, 1.0],
            tileMode: TileMode.mirror,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: FlipCard(
                key: cardKey,
                flipOnTouch: false,
                speed: 2000,
                front: Center(
                  child: _cardIngreso(context),
                ),
                back: Center(child: _cardRegistro(context))),
          ),
        ),
      ),
    );
  }

  Widget _cardIngreso(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shadowColor: Colors.amber,
        clipBehavior: Clip.antiAlias,
        elevation: 10.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          children: <Widget>[
            _insertarLogo(),
            _crearInput(context),
            _crearPassword(context),
            _botonIngreso(context),
            _botonGirar(),
          ],
        ),
      ),
    );
  }

  Widget _crearInput(BuildContext context) {
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
              // hintText: 'Nombre',
              labelText: 'Nombre',
              suffixIcon: Icon(
                Icons.accessibility,
              ),
              icon: Icon(
                Icons.account_circle,
              )),
        ),
      ),
    );
  }

  Widget _crearPassword(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 0),
      width: 280,
      height: 60,
      child: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Color.fromRGBO(255, 38, 0, 1),
        ),
        child: TextField(
          // autofocus: true,
          obscureText: true,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              // hintText: 'Password',
              labelText: 'Clave',
              suffixIcon: Icon(Icons.security),
              icon: Icon(Icons.lock)),
        ),
      ),
    );
  }

  Widget _insertarLogo() {
    int r = 255;
    int g = 255;
    int b = 255;

    return Center(
      // widthFactor: 1,
      // heightFactor: 1,
      child: Container(
          padding: EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 0),
          width: 160,
          //height: 300,
          child: Column(
            children: [
              FadeInImage(
                placeholder: AssetImage('assets/jar-loading.gif'),
                image: AssetImage('assets/Logo.png'),
                fit: BoxFit.cover,
              )
            ],
          )),
    );
  }

  Widget _botonIngreso(BuildContext context) {
    return Center(
      widthFactor: 1,
      heightFactor: 1,
      child: Container(
        padding: EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 0),
        width: 160,
        height: 60,
        child: RaisedButton(
          child: Text('Ingresar'),
          color: Colors.orange,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () {
            Navigator.pushNamed(context, 'menu');
            // _mostrarAlert(context);
          },
        ),
      ),
    );
  }

  Widget _botonGirar() {
    return Center(
      widthFactor: 1,
      heightFactor: 1,
      child: Container(
        padding: EdgeInsets.only(left: 0, right: 0, top: 5, bottom: 8),
        width: 160,
        height: 60,
        child: RaisedButton(
          child: Text('Nuevo pintor'),
          color: Colors.grey[600],
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () {
            cardKey.currentState.toggleCard();
          },
        ),
      ),
    );
  }

  Widget _botonGirarReg() {
    return Center(
      widthFactor: 1,
      heightFactor: 1,
      child: Container(
        padding: EdgeInsets.only(left: 0, right: 0, top: 5, bottom: 8),
        width: 160,
        height: 60,
        child: RaisedButton(
          child: Text('Ingresar'),
          color: Colors.grey[600],
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () {
            cardKey.currentState.toggleCard();
          },
        ),
      ),
    );
  }

  Widget _botonRegistro() {
    return Center(
      widthFactor: 1,
      heightFactor: 1,
      child: Container(
        padding: EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 0),
        width: 160,
        height: 60,
        child: RaisedButton(
          child: Text('Registrar'),
          color: Colors.orange,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () {
            // _mostrarAlert(context);
          },
        ),
      ),
    );
  }

  Widget _cardRegistro(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shadowColor: Colors.amber,
        clipBehavior: Clip.antiAlias,
        elevation: 10.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          children: <Widget>[
            _insertarLogo(),
            _crearInput(context),
            _crearPassword(context),
            // _crearPassword(context),
            _codigo(context),
            _botonRegistro(),
            _botonGirarReg()
          ],
        ),
      ),
    );
  }

  Widget _codigo(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 0),
      width: 280,
      height: 60,
      child: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Color.fromRGBO(255, 38, 0, 1),
        ),
        child: TextField(
          textAlign: TextAlign.center,
          maxLength: 4,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ], // Only numbers can be entered
          decoration: InputDecoration(
              counterText: '',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              // hintText: 'Password',
              labelText: 'Codigo',
              suffixIcon: Icon(Icons.check_circle),
              icon: Icon(Icons.lock)),
        ),
      ),
    );
  }
}
