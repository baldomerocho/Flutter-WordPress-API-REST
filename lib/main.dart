import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html/parser.dart';
import 'package:lugaresasombrosos/screens/categorias.dart';
import 'package:lugaresasombrosos/screens/post.dart';
import 'package:lugaresasombrosos/widgets/menu.dart';

import 'apis/wordpress.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textiTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Lugares Asombrosos',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.deepOrange,
          textTheme: GoogleFonts.montserratTextTheme(textiTheme).copyWith(
            // ignore: deprecated_member_use
            title:GoogleFonts.montserrat(
              textStyle: TextStyle(
                color:Colors.white70,
                fontSize: 20
              ),
              fontWeight: FontWeight.w700
            )
          )
        ),
        textTheme: GoogleFonts.montserratTextTheme(
          textiTheme.copyWith(
            // ignore: deprecated_member_use
            body1: GoogleFonts.montserrat(
              fontSize:18
            )
          )
        ),

        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      initialRoute:HomePage.routeName,
      routes: {
        HomePage.routeName : (BuildContext contex) => HomePage(),
        DetalleDelPost.routeName : (BuildContext context) => DetalleDelPost(),
        Categorias.routeName : (BuildContext context) => Categorias()
      },
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);
  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: menu(context),
      appBar: AppBar(
        title: Text('Lugares Asombrosos Blogs'),
      ),
      body: ListView(
        children: [
          Text("Blog desde WordPress"),
          FutureBuilder(
            future: lugares(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var posts = snapshot.data;
                return Column(
                  children: [
                    ...posts.map((e){
                      return GestureDetector(
                      onTap: ()=> Navigator.of(context).pushNamed(DetalleDelPost.routeName, arguments: e),
                      child: Column(
                        children: <Widget>[
                          FadeInImage(
                            placeholder: AssetImage('assets/loading.gif'), 
                            image: NetworkImage(e["_embedded"]["wp:featuredmedia"][0]["media_details"]["sizes"]["medium_large"]["source_url"])
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: <Widget>[
                                Text(e['title']['rendered'], style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700
                                  )
                                ),),
                                Text(parse(e['content']['rendered']).documentElement.text, maxLines: 3,)
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                    }).toList(),
                  ]
                  );
                
              } else {
                return Center(child: CircularProgressIndicator());
              }
              
            },
          ),
        ],
      ),
    );
  }
}