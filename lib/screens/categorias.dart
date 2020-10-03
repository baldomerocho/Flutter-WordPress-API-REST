import 'package:flutter/material.dart';
import 'package:lugaresasombrosos/widgets/menu.dart';

class Categorias extends StatelessWidget {
  const Categorias({Key key}) : super(key: key);
  static const routeName = 'paginadecategorias';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: menu(context),
      appBar: AppBar(
        title: Text('Categorias')
      ),
      body: ListView(
        children: <Widget>[
          Center(child: Text('aqui estoy')),
        ],
      ),
    );
  }
}
