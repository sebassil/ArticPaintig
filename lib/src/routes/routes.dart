import 'package:appauditoria/src/pages/lista.dart';
import 'package:appauditoria/src/pages/login_page.dart';
import 'package:appauditoria/src/pages/menu_bot.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'login': (BuildContext context) => LoginPage(),
    'menu': (BuildContext context) => MenuBot(),
    // 'lista': (BuildContext context) => ListaTrabajos(),
  };
}
