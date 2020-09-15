import 'package:flutter/material.dart';
import 'dart:io';

List<String> as1 = new List<String>();
List<String> as2 = new List<String>();
List<String> as3 = new List<String>();

class ListaTrabajos extends StatefulWidget {
  ListaTrabajos({Key key}) : super(key: key);

  @override
  _ListaTrabajosState createState() => _ListaTrabajosState();
}

class _ListaTrabajosState extends State<ListaTrabajos> {
  @override
  void initState() {
    as1.clear();
    as1.add('assets/movil.png');
    as1.add('assets/bats.jpg');
    as1.add('assets/goku.jpg');
    as2.clear();
    as2.add('assets/joker.jpg');
    as2.add('assets/rick_and_morty.jpg');
    as2.add('assets/spidey.jpg');
    as3.clear();
    as3.add('assets/assassins.jpg');
    as3.add('assets/naruto.jpg');
    as3.add('assets/spidey.jpg');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          contentPadding: EdgeInsets.all(20),
          title: Text(
            "Avenida 3 numero 5-08",
            textAlign: TextAlign.center,
          ),
          leading: Image.asset(
            "assets/movil.png",
            width: 100,
            height: 100,
          ),
          onTap: () {
            _cardImagenes(context, as1);
          },
        ),
        Divider(
          color: Color.fromRGBO(255, 38, 0, 1),
          height: 3,
        ),
        ListTile(
          contentPadding: EdgeInsets.all(20),
          title: Text(
            "Carrera 7 numero 34-8",
            textAlign: TextAlign.center,
          ),
          leading: Image.asset(
            "assets/assassins.jpg",
            width: 100,
            height: 100,
          ),
          onTap: () {
            _cardImagenes(context, as3);
          },
        ),
        Divider(
          color: Color.fromRGBO(255, 38, 0, 1),
          height: 3,
        ),
        ListTile(
          contentPadding: EdgeInsets.all(20),
          title: Text(
            "Calle 5b numero 17-3",
            textAlign: TextAlign.center,
          ),
          leading: Image.asset(
            "assets/joker.jpg",
            width: 100,
            height: 100,
          ),
          onTap: () {
            _cardImagenes(context, as2);
          },
        ),
        Divider(
          color: Color.fromRGBO(255, 38, 0, 1),
          height: 3,
        )
      ],
    );
  }

  void _cardImagenes(BuildContext context, List<String> a) {
    print(a.length);
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
                    horizontalView(a),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        'Dirección:',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Text(
                        'Avenida 3 numero 5-08',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        'Extra:',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0),
                      child: Text(
                        'Barrio alameda',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        'Fecha:',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        '12-sep-2020',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget horizontalView(List<String> a) {
    print(a.length);
    return Container(
      alignment: Alignment.center,
      height: 180.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: a.length,
        itemBuilder: (context, index) {
          final imagen = a[index];
          return InkWell(
            onTap: () {
              _verImagen(context, a[index]);
              // _mostrarImagen(context, imagen, index);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Container(
                width: 200.0,
                // color: Colors.grey,
                child: Image.asset(
                  imagen,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _verImagen(BuildContext context, String a) {
    print(a.length);
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
                    Image.asset(a),
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
