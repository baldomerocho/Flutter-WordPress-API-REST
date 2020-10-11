import 'package:flutter/material.dart';
import 'package:lugaresasombrosos/apis/wordpress.dart';
import 'package:lugaresasombrosos/screens/post.dart';


class BuscadorWP extends SearchDelegate{
  BuscadorWP() : super(searchFieldLabel: "Escribe algo...");
  @override
  List<Widget> buildActions(BuildContext context) {
      return [
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: (){
            query = "";
          },
        )
      ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: (){
          close(context, null);
        },
      );
    }
  
    @override
    Widget buildResults(BuildContext context) {
      return Container();
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
      if (query.isEmpty) {
        return Center(child: Text("No haz realizado una búsqueda"),);
      } else {
        return FutureBuilder(
          future: busqueda(query),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  Map resultado = snapshot.data[index];
                  return ListTile(
                    title: Text(resultado['title']['rendered']),
                    onTap: ()=> Navigator.of(context).pushNamed(DetalleDelPost.routeName, arguments: resultado)
                  );
                },
              );
            }else{
              return Center(child: CircularProgressIndicator(),);
            }
          },
        );
      }
  }
}