import 'package:flutter/material.dart';
import 'package:appalya/views/item.view.aboutme.dart';
import 'package:appalya/views/item.view.goodbaby.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appalya/controllers/item.controller.dart';
import 'package:provider/provider.dart';
import 'package:appalya/views/item.view.dart';
import 'package:appalya/views/item.view.getaluck.dart';
import 'package:appalya/views/item.view.goodsongs.dart';

class TOGO extends StatefulWidget {
  @override
  _TOGOState createState() => _TOGOState();
}

class _TOGOState extends State<TOGO> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  String _theme = 'Light';
  var _themeData = ThemeData.light();

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  //Estilos criados para variáveis com o tema claro
  TextStyle labeltogo = TextStyle(
      fontSize: 20,
      color: Colors.black87,
      letterSpacing: 4.0,
      fontWeight: FontWeight.bold,
  );

  TextStyle labeltogoSubtitle = TextStyle(
    fontSize: 16,
    color: Colors.black54,
    letterSpacing: 2.0,
    fontWeight: FontWeight.normal,
  );

  //Estilos criados para variáveis com o tema escuro
  TextStyle labeltogo2 = TextStyle(
    fontSize: 20,
    color: Colors.white,
    letterSpacing: 4.0,
    fontWeight: FontWeight.bold,
  );

  TextStyle labeltogoSubtitle2 = TextStyle(
    fontSize: 16,
    color: Colors.white70,
    letterSpacing: 2.0,
    fontWeight: FontWeight.normal,
  );

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      //App barra
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(51,185,255,10),
        title: Text('To Go'),
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
          child: Container(
            margin: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text('Austrália\n', style: (_theme == 'Light') ? labeltogo : labeltogo2, textAlign: TextAlign.center),
                Image.asset('images/au.jpg'),
                Text('\nA Austrália é um país continental cercado pelos oceanos Índico e Pacífico. Suas principais cidades, Sydney, Brisbane, Melbourne, Perth e Adelaide, são costeiras. Sua capital, Camberra, não é litorânea.\n',
                    style: (_theme == 'Light') ? labeltogoSubtitle : labeltogoSubtitle2, textAlign: TextAlign.center),

                Text('\nBelo Horizonte\n', style: (_theme == 'Light') ? labeltogo : labeltogo2, textAlign: TextAlign.center),
                Image.asset('images/bh.jpg'),
                Text('\nBelo Horizonte é a capital do estado de Minas Gerais, no sudeste do Brasil. Rodeada de montanhas, a cidade é conhecida pelo enorme Estádio Mineirão.\n',
                    style:(_theme == 'Light') ? labeltogoSubtitle : labeltogoSubtitle2, textAlign: TextAlign.center),

                Text('\nDublin\n', style: (_theme == 'Light') ? labeltogo : labeltogo2, textAlign: TextAlign.center),
                Image.asset('images/dublin.jpg'),
                Text('\nDublin, capital da República da Irlanda, fica na costa leste do país, na foz do Rio Liffey. Entre seus prédios históricos destacam-se o Castelo de Dublin, que data do século 13, e a imponente Catedral de St Patrick, fundada em 1191. \n',
                    style:(_theme == 'Light') ? labeltogoSubtitle : labeltogoSubtitle2, textAlign: TextAlign.center),

                Text('\nRio de Janeiro\n',style: (_theme == 'Light') ? labeltogo : labeltogo2, textAlign: TextAlign.center),
                Image.asset('images/rj.jpg'),
                Text('\nO Rio de Janeiro é uma grande cidade brasileira à beira-mar, famosa pelas praias de Copacabana e Ipanema, pela estátua de 38 metros de altura do Cristo Redentor, no topo do Corcovado, e pelo Pão de Açúcar, um pico de granito com teleféricos até seu cume.\n',
                    style:(_theme == 'Light') ? labeltogoSubtitle : labeltogoSubtitle2, textAlign: TextAlign.center),

                Text('\nSão Paulo\n', style: (_theme == 'Light') ? labeltogo : labeltogo2, textAlign: TextAlign.center),
                Image.asset('images/sp.jpg'),
                Text('\nSão Paulo, centro financeiro do Brasil, está entre as cidades mais populosas do mundo, com diversas instituições culturais e uma rica tradição arquitetônica.\n',
                    style:(_theme == 'Light') ? labeltogoSubtitle : labeltogoSubtitle2, textAlign: TextAlign.center),

                Text('\nNatal\n', style: (_theme == 'Light') ? labeltogo : labeltogo2, textAlign: TextAlign.center),
                Image.asset('images/natal.png'),
                Text('\nNatal é a capital do estado de Rio Grande do Norte, na extremidade nordeste do Brasil. É conhecida pelas extensas dunas de areia costeiras e pelo Forte dos Reis Magos, em forma de estrela, uma fortaleza portuguesa do século XVI na foz do rio Potengi.\n',
                    style:(_theme == 'Light') ? labeltogoSubtitle : labeltogoSubtitle2, textAlign: TextAlign.center),
              ],
           ),
        ),
      ),
    );

    //Sobre o Menu
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
