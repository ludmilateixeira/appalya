import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appalya/controllers/item.controller.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui1;
import 'package:appalya/views/item.view.dart';
import 'package:appalya/views/item.view.getaluck.dart';
import 'package:appalya/views/item.view.goodsongs.dart';
import 'package:appalya/views/item.view.togo.dart';
import 'package:appalya/views/item.view.goodbaby.dart';

class AboutMe extends StatefulWidget {
  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  String _theme = 'Light';
  var _themeData = ThemeData.light();

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  //Estilos para fontes
  TextStyle labelAboutMe = TextStyle(
      fontSize: 22,
      foreground: Paint()
        ..shader = ui1.Gradient.linear(
          const Offset(0, 50),
          const Offset(150, 20),
          <Color>[
            Colors.cyan,
            Colors.indigoAccent,
          ],
        )
  );

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(

      //App barra
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(51,185,255,10),
        title: Text('This is me'),
        titleSpacing: 15,
        actions: [
          _PopupMenuButton(),
        ],
        ),

      //Lista suspensa
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

      //Corpo
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text('This can be me today\n', style:labelAboutMe, textAlign: TextAlign.center),
                Image.asset('images/me.png'),
                Text('\nCheck about me on Linkedin!\n', style:labelAboutMe, textAlign: TextAlign.center),
                Image.asset('images/qr.png')
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
