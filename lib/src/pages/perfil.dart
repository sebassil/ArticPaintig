import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  PerfilPage({Key key}) : super(key: key);

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Center(
            child: Icon(
              Icons.account_circle,
              size: 100,
              color: Color.fromRGBO(255, 38, 0, 1),
            ),
          ),
        ),
        Text(
          'Camilo Perez',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        Container(
          width: 150,
          // height: 50,
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: RaisedButton(
              shape: StadiumBorder(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Editar nombre',
                    textAlign: TextAlign.center,
                  ),
                  Icon(Icons.edit),
                ],
              ),
              onPressed: () {},
            ),
          ),
        ),
        Container(
          width: 150,
          // height: 40,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: RaisedButton(
              shape: StadiumBorder(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Editar clave',
                    textAlign: TextAlign.center,
                  ),
                  Icon(Icons.edit),
                ],
              ),
              onPressed: () {},
            ),
          ),
        )
      ],
    );
  }
}
