import 'package:flutter/material.dart';
import 'package:lugaresasombrosos/screens/categorias.dart';

import '../main.dart';

menu(context){
  return Drawer(
    child: ListView(children: <Widget>[
      DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.black87
        ),
        child: Center(child: Text('Comp. Lugares!', style: TextStyle(fontSize: 30, color: Colors.white),),)
      ),
      Column(children: <Widget>[
        ListTile(
          title: Text('Inicio'),
          leading:Icon(Icons.home),
          onTap: ()=> Navigator.pushNamed(context, HomePage.routeName)
        ),
        ListTile(
          title: Text('Categorias'),
          leading:Icon(Icons.list),
          onTap: ()=> Navigator.pushNamed(context, Categorias.routeName)
        ),
        Divider(),
        ListTile(
          title: Text('Categorias'),
          leading:Icon(Icons.list),
          onTap: (){},
        ),
      ])
    ],)
  );
}