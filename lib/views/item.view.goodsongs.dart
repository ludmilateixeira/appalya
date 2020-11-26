import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appalya/controllers/item.controller.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui2;
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:appalya/views/item.view.dart';
import 'package:appalya/views/item.view.getaluck.dart';
import 'package:appalya/views/item.view.aboutme.dart';
import 'package:appalya/views/item.view.togo.dart';
import 'package:appalya/views/item.view.goodbaby.dart';

class GoodSongs extends StatefulWidget {
  @override
  _GoodSongsState createState() => _GoodSongsState();
}

class _GoodSongsState extends State<GoodSongs> {
  //Music
  AudioCache audioCache = AudioCache();
  AudioPlayer audioPlayer = AudioPlayer();

  playLocal(String name) async {
    audioPlayer.stop();
    audioPlayer = await audioCache.play(name);
  }

  //Controladores
  final _navigatorKey = GlobalKey<NavigatorState>();

  String _theme = 'Light';
  var _themeData = ThemeData.light();

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  //Estilo de fonte
  TextStyle labelvar2 = TextStyle(
      fontSize: 18,
      foreground: Paint()
        ..shader = ui2.Gradient.linear(
          const Offset(0, 150),
          const Offset(100, 550),
          <Color>[
            Color.fromARGB(255, 51, 204, 255),
            Color.fromARGB(255, 255, 153, 204),
          ],
        )
  );

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(

      //App barra
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(51,185,255,10),
        title: Text('To Relaxe or No'),
        titleSpacing: 15,
        actions: [
          _PopupMenuButton(),
        ],
        ),

      //Lista Suspensa
      drawer: Drawer(
        child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
        DrawerHeader(
          child: Text('Hold onto Hope',
          style:TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          )),
          decoration: BoxDecoration(
          color: Color.fromRGBO(51,187,255,10),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('images/cover.jpeg')
              )
          )
          ),
          ListTile(
            title: Text('About me?', style: TextStyle(fontSize: 18)),
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainApp())
              );
            },
          ),
          ListTile(
          title: Text('Get a luck', style: TextStyle(fontSize: 18)),
          onTap: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => GetAluck())
            );
          },
          ),
          ListTile(
            title: Text('So cute', style: TextStyle(fontSize: 18)),
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GoodBaby())
              );
            },
          ),
          ListTile(
            title: Text('Good songs', style: TextStyle(fontSize: 18)),
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GoodSongs())
              );
            },
          ),
          ListTile(
            title: Text('To Go', style: TextStyle(fontSize: 18)),
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TOGO())
              );
            },
          ),
          ListTile(
            title: Text('Me, Myself and I', style: TextStyle(fontSize: 18)),
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutMe())
              );
            },
          ),
          ],
          ),
        ),
      //http://www.macoratti.net/19/06/flut_widgt2.htm
      //https://qastack.com.br/programming/49991444/create-a-rounded-button-button-with-border-radius-in-flutter

      //Corpo
      body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20.0),
              child: ButtonTheme(
                  minWidth: double.infinity,
                  child: Column(
                    children: [
                      //Botões das músicas
                       RaisedButton(onPressed: () {
                           playLocal("music/golden.mp3");
                         },
                             color: Colors.white,
                             splashColor: Colors.lightBlueAccent,
                             elevation: 3.0,
                             shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(5.0),
                                 side: BorderSide(color: Colors.white)
                             ),
                             child: Text("Harry Style - Golden", style: labelvar2, textAlign: TextAlign.center)
                         ),
                      RaisedButton(onPressed: () {
                        playLocal("music/home.mp3");
                      },
                          color: Colors.white,
                          splashColor: Colors.lightBlueAccent,
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(color: Colors.white)
                          ),
                          child: Text("Justin Bieber - Home", style: labelvar2, textAlign: TextAlign.center)
                      ),
                      RaisedButton(onPressed: () {
                        playLocal("music/copycat.mp3");
                      },
                          color: Colors.white,
                          splashColor: Colors.lightBlueAccent,
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(color: Colors.white)
                          ),
                          child: Text("Billie Eilish - Copycat", style: labelvar2, textAlign: TextAlign.center)
                      ),
                      RaisedButton(onPressed: () {
                        playLocal("music/forget.mp3");
                      },
                          color: Colors.white,
                          splashColor: Colors.lightBlueAccent,
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(color: Colors.white)
                          ),
                          child: Text("Machine Gun Kelly ft. Halsey - Forget me Too", style: labelvar2, textAlign: TextAlign.center)
                      ),
                      RaisedButton(onPressed: () {
                        playLocal("music/monster.mp3");
                      },
                          color: Colors.white,
                          splashColor: Colors.lightBlueAccent,
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(color: Colors.white)
                          ),
                          child: Text("Justin Bieber and Shawn Mendes - Monster", style: labelvar2, textAlign: TextAlign.center)
                      ),
                      RaisedButton(onPressed: () {
                        playLocal("music/roses.mp3");
                      },
                          color: Colors.white,
                          splashColor: Colors.lightBlueAccent,
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(color: Colors.white)
                          ),
                          child: Text("Hayley Williams - Roses", style: labelvar2, textAlign: TextAlign.center)
                      ),
                      RaisedButton(onPressed: () {
                        playLocal("music/sweater.mp3");
                      },
                          color: Colors.white,
                          splashColor: Colors.lightBlueAccent,
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(color: Colors.white)
                          ),
                          child: Text("The Neighbourhood - Sweater Weather", style: labelvar2, textAlign: TextAlign.center)
                      ),
                      RaisedButton(onPressed: () {
                        playLocal("music/sugar.mp3");
                      },
                          color: Colors.white,
                          splashColor: Colors.lightBlueAccent,
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(color: Colors.white)
                          ),
                          child: Text("Brockhampton - Sugar", style: labelvar2, textAlign: TextAlign.center)
                      ),
                      RaisedButton(onPressed: () {
                        playLocal("music/aint.mp3");
                      },
                          color: Colors.white,
                          splashColor: Colors.lightBlueAccent,
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(color: Colors.white)
                          ),
                          child: Text("Paramore - Ain't it Fun", style: labelvar2, textAlign: TextAlign.center)
                      ),
                      RaisedButton(onPressed: () {
                        playLocal("music/espaco.mp3");
                      },
                          color: Colors.white,
                          splashColor: Colors.lightBlueAccent,
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(color: Colors.white)
                          ),
                          child: Text("Day - Espaço", style: labelvar2, textAlign: TextAlign.center)
                      ),
                      RaisedButton(onPressed: () {
                        playLocal("music/1950.mp3");
                      },
                          color: Colors.white,
                          splashColor: Colors.lightBlueAccent,
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(color: Colors.white)
                          ),
                          child: Text("King Princess - 1950", style: labelvar2, textAlign: TextAlign.center)
                      ),
                      RaisedButton(onPressed: () {
                        playLocal("music/vnan.mp3");
                      },
                          color: Colors.white,
                          splashColor: Colors.lightBlueAccent,
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(color: Colors.white)
                          ),
                          child: Text("Knust | Cesar Mc | Chris | Xamã - Você não ama ninguém", style: labelvar2, textAlign: TextAlign.center)
                      ),
                      RaisedButton(onPressed: () {
                        playLocal("music/outrodia.mp3");
                      },
                          color: Colors.white,
                          splashColor: Colors.lightBlueAccent,
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(color: Colors.white)
                          ),
                          child: Text("Lourena - Mazin - Azzy - Black - Outro dia", style: labelvar2, textAlign: TextAlign.center)
                      ),
                      //Botão de Cancelar
                      RaisedButton(onPressed: () {
                        audioPlayer.stop();
                      },
                        color: Colors.white,
                        splashColor: Colors.lightBlueAccent,
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(color: Colors.red[700])
                        ),
                        child: Text("GIVE A BREAK!",
                          style: TextStyle(fontSize:  18, color: Colors.red[700], fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                ),
              ),
            ),
          ),
      );

    return MultiProvider(
      providers:[
        Provider<ItemController>.value(value: ItemController()),
      ],
      child: MaterialApp(
      navigatorKey: _navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: _themeData,
      home: scaffold,
    ),
    );
  }

  //Carregando o tema salvo pelo usuário
  _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _theme = (prefs.getString('theme') ?? 'Light');
      _themeData = _theme == 'Dark' ? ThemeData.dark() : ThemeData.light();
    });
  }

  _setTheme(theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _theme = theme;
      _themeData = theme == 'Dark' ? ThemeData.dark() : ThemeData.light();
      prefs.setString('theme', theme);
    });
  }

  //Menu Change Theme
  // ignore: non_constant_identifier_names
  _PopupMenuButton(){
    return PopupMenuButton(
      onSelected: (value) => _setTheme(value) ,
      itemBuilder: (context) {
        var list = List<PopupMenuEntry<Object>>();
        list.add(
          PopupMenuItem(
              child: Text("Theme Configuration")
          ),
        );
        list.add(
          PopupMenuDivider(
            height: 10,
          ),
        );
        list.add(
          CheckedPopupMenuItem(
            child: Text("Light"),
            value: 'Light',
            checked: _theme == 'Light',
          ),
        );
        list.add(
          CheckedPopupMenuItem(
            child: Text("Dark"),
            value: 'Dark',
            checked: _theme == 'Dark',
          ),
        );
        return list;
      },
    );
  }
}
