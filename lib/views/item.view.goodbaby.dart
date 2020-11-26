import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appalya/controllers/item.controller.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;
import 'package:appalya/views/item.view.dart';
import 'package:appalya/views/item.view.getaluck.dart';
import 'package:appalya/views/item.view.aboutme.dart';
import 'package:appalya/views/item.view.goodsongs.dart';
import 'package:appalya/views/item.view.togo.dart';

class GoodBaby extends StatefulWidget {
  @override
  _GoodBabyState createState() => _GoodBabyState();
}

class _GoodBabyState extends State<GoodBaby> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  String _theme = 'Light';
  var _themeData = ThemeData.light();

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  //Estilo de fonte
  TextStyle labelvar = TextStyle(
      fontSize: 20,
      foreground: Paint()
        ..shader = ui.Gradient.linear(
          const Offset(0, 100),
          const Offset(150, 20),
          <Color>[
            Colors.deepPurple,
            Colors.cyan,
          ],
        )
  );

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      //App Barra
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(51,185,255,10),
        title: Text('One baby, maybe?'),
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

      //Corpo
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Image.asset('images/img1.jpg'),
                Image.asset('images/img2.jpg'),
                Image.asset('images/img3.jpg'),
                Image.asset('images/img4.jpg'),
                Image.asset('images/img5.jpg'),
                Image.asset('images/img6.jpg'),
                Image.asset('images/img7.jpg'),
                Image.asset('images/img8.jpg'),
                Image.asset('images/img9.jpg'),
                Image.asset('images/img10.jpg'),
                Image.asset('images/img11.jpg'),
                Image.asset('images/img12.jpg'),
                Image.asset('images/img13.jpg'),
                Image.asset('images/img14.jpeg'),
                Image.asset('images/img15.jpg'),
                Image.asset('images/img16.jpg'),
                Image.asset('images/img17.jpg'),
                Image.asset('images/img18.jpg'),
                Image.asset('images/img19.jpg'),
                Image.asset('images/img20.jpg')
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
