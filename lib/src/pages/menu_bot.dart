import 'dart:ui';
import 'package:appauditoria/src/pages/PageAgregarDos.dart';
import 'package:flutter/material.dart';

int _selected = 0;

class MenuBot extends StatefulWidget {
  MenuBot({Key key}) : super(key: key);

  @override
  _MenuBotState createState() => _MenuBotState();
}

class _MenuBotState extends State<MenuBot> {
  final List<Widget> _listaw = <Widget>[
    PageAgregarDos(),
    _pagLista(),
    _pagPerfil()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 38, 0, .9),
        centerTitle: true,
        title: Stack(
          children: <Widget>[
            // Stroked text as border.
            Text(
              'Artic painting',
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
              'Artic painting app',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: _listaw[_selected],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selected,
        unselectedItemColor: Color.fromRGBO(255, 38, 0, .9),
        selectedItemColor: Color.fromRGBO(0, 20, 0, .9),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_a_photo),
            title: Text('Agregar'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('Lista'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Perfil'),
          ),
        ],
        onTap: (index) {
          setState(() {
            _selected = index;
            print(index);
            print(_selected);
          });
        },
      ),
    );
  }
}

//termina

Widget _pagPerfil() {
  return Container();
}

Widget _pagLista() {
  return Container();
}
