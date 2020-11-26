import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appalya/controllers/item.controller.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;
import 'package:appalya/views/item.view.dart';
import 'package:appalya/views/item.view.goodbaby.dart';
import 'package:appalya/views/item.view.aboutme.dart';
import 'package:appalya/views/item.view.goodsongs.dart';
import 'package:appalya/views/item.view.togo.dart';

class GetAluck extends StatefulWidget {
  @override
  _GetAluckState createState() => _GetAluckState();
}

class _GetAluckState extends State<GetAluck> {
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

      //App barra
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(51,185,255,10),
        title: Text('Just scroll and stop!'),
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
      body: ListWheelScrollView(
              children: [
                Text('O otimismo é a fé em ação. Nada se pode levar a efeito sem otimismo.\n', style:labelvar, textAlign: TextAlign.center),
                Text('Tudo vale a pena quando a alma não é pequena.\n', style:labelvar, textAlign: TextAlign.center),
                Text('Pedras no caminho? Eu guardo todas. Um dia vou construir um castelo.\n', style:labelvar, textAlign: TextAlign.center),
                Text('Imagine uma nova história para sua vida e acredite nela.\n', style:labelvar, textAlign: TextAlign.center),
                Text('O que quer que você lute, você fortalece, e o que você resiste, persiste.', style:labelvar, textAlign: TextAlign.center),
                Text('Acredita que vale a pena viver, e a tua convicção ajudará a criar esse fato.\n', style:labelvar, textAlign: TextAlign.center),
                Text('Acredite em seus ideais e lute por eles, até que eles se tornem um dogma para você.\n', style:labelvar, textAlign: TextAlign.center),
                Text('Valorize quem te quer bem, lute por seus ideais, não desista dos seus sonhos!\n', style:labelvar, textAlign: TextAlign.center),
                Text('O interesse que tenho em acreditar numa coisa não é a prova da existência dessa coisa.\n', style:labelvar, textAlign: TextAlign.center),
                Text('Não é bom pensar que amanhã é um novo dia sem erros nele ainda?\n', style:labelvar, textAlign: TextAlign.center),
                Text('O homem pode acreditar no impossível, mas nunca pode acreditar no improvável.\n', style:labelvar, textAlign: TextAlign.center),
                Text('Os homens que realmente acreditam em si mesmos estão todos em asilos de loucos.\n', style:labelvar, textAlign: TextAlign.center),
                Text('Não posso acreditar num Deus que quer ser louvado o tempo todo.\n', style:labelvar, textAlign: TextAlign.center),
                Text('É triste quando amigos viram inimigos, mas o pior é quando eles se tornam desconhecidos.', style:labelvar, textAlign: TextAlign.center),
                Text('Prefiro viver em um mundo de fantasias do que viver em um mundo que não acredita em sonhos.\n', style:labelvar, textAlign: TextAlign.center),
                Text('Nunca exigi que as pessoas me entendessem, mas respeito é uma coisa que todo mundo deveria ter.\n', style:labelvar, textAlign: TextAlign.center),
                Text('Ame as pessoas, não as coisas. Use as coisas, não as pessoas.\n', style:labelvar, textAlign: TextAlign.center),
                Text('Às vezes é preciso uma boa queda para realmente saber onde você está.\n', style:labelvar, textAlign: TextAlign.center),
                Text('Às vezes bate aquela vontade de ir embora, mesmo sem ter pra onde ir.\n', style:labelvar, textAlign: TextAlign.center),
                Text('Lembre-se: sua verdadeira força, vem de dentro.\n', style:labelvar, textAlign: TextAlign.center),
                Text('A vida é algo belíssimo e na minha não há espaço para ódio. Então se você me odeia, vá socar sua própria face e talvez isso alivie sua raiva.\n', style:labelvar, textAlign: TextAlign.center),
                Text('A beleza não está em você. Está em seu coração.\n', style:labelvar, textAlign: TextAlign.center),
                Text('É isso que você ganha quando deixa seu coração ganhar.\n', style:labelvar, textAlign: TextAlign.center),
                Text('Talvez eu saiba, em algum lugar no fundo da alma, que o amor nunca dura. E temos que arranjar outros meios de seguir em frente sozinhos.\n', style:labelvar, textAlign: TextAlign.center),
                Text('Você construiu um mundo de mágica, porque sua vida real é trágica.\n', style:labelvar, textAlign: TextAlign.center),
                Text('Na próxima vez que você apontar um dedo, eu vou te apontar ao espelho.\n', style:labelvar, textAlign: TextAlign.center),
                Text('Mantenha seus pés no chão quando sua cabeça estiver nas nuvens.\n', style:labelvar, textAlign: TextAlign.center),
                Text('Não se esqueça de construir sua casa tijolo por tijolo, ou o lobo vai soprar!\n', style:labelvar, textAlign: TextAlign.center),
                Text('Olhe para cima, que é de lá que vem tua força!\n', style:labelvar, textAlign: TextAlign.center),
                Text('Agora é a hora de começar a surpreender aqueles que duvidaram de você!\n', style:labelvar, textAlign: TextAlign.center),
                Text('Não importa o que você decidiu. O que importa é que isso te faz feliz.\n', style:labelvar, textAlign: TextAlign.center),
                Text('Quando pensar em desistir, lembre-se porque começou.\n', style:labelvar, textAlign: TextAlign.center),
                Text('Se não puder fazer tudo, faça tudo que puder.\n', style:labelvar, textAlign: TextAlign.center),
                Text('Por mais difícil que algo possa parecer, jamais desista antes de tentar!\n', style:labelvar, textAlign: TextAlign.center),
                Text('Acreditar é a força que nos permite subir os maiores degraus da vida.\n', style:labelvar, textAlign: TextAlign.center),
                Text('A fé em Deus nos faz crer no incrível, ver o invisível e realizar o impossível.\n', style:labelvar, textAlign: TextAlign.center),
                Text('A fé não é a estrada, mas pode ser a força que nos faz caminhar.\n', style:labelvar, textAlign: TextAlign.center),
                Text('Foco, força e fé é o lema dos vencedores.\n', style:labelvar, textAlign: TextAlign.center),
                Text('A influência de bons professores ninguém consegue apagar.\n', style:labelvar, textAlign: TextAlign.center),
                Text('Ser professor é ser um condutor de almas e sonhos. É lapidar diamantes.\n', style:labelvar, textAlign: TextAlign.center),
                Text('O professor pode ser uma grande influência para orientar seus alunos a um caminho de sucesso.\n', style:labelvar, textAlign: TextAlign.center),
                Text('Alguns professores contribuem para a nossa educação, outros deixam marcas para a vida inteira.\n', style:labelvar, textAlign: TextAlign.center),
                Text('Ser sonhador, ser semeador, ser transformador, ser professor!\n', style:labelvar, textAlign: TextAlign.center),
                Text('Ser ensinador é poder construir e reconstruir formas diferentes e competentes de viver e conviver.\n', style:labelvar, textAlign: TextAlign.center)
              ],
            itemExtent: 100,
            useMagnifier: true,
            diameterRatio: 2.0,
            magnification: 0.9,
            overAndUnderCenterOpacity: 0.5
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
