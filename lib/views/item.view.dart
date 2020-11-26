import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_share/social_share.dart';
import 'package:appalya/models/item.model.dart';
import 'package:appalya/controllers/item.controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../app_status.dart';
import 'package:appalya/views/item.view.getaluck.dart';
import 'package:appalya/views/item.view.goodbaby.dart';
import 'package:appalya/views/item.view.aboutme.dart';
import 'package:appalya/views/item.view.goodsongs.dart';
import 'package:appalya/views/item.view.togo.dart';

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  var _controller = ItemController();

  List _listagem=[];
  ItemController _icontroller;

  String _theme = 'Light';
  var _themeData = ThemeData.light();

  @override
  void initState() {
    super.initState();
    _loadTheme();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.getAll().then((data) {
        setState(() {
          _listagem = _controller.list;
        });
      });
    });
  }

  //Forms
  final _formKey = GlobalKey<FormState>();
  var _themeaningController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var scaffold = Builder(builder:(context) => Scaffold(

      //App barra
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(51,185,255,10),
        title: Text('What do I mean?'),
        titleSpacing: 15,
        actions: [
          _PopupMenuButton(),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () async{
              var itens = _listagem.reduce((value, element) => value + '\n' + element);
              SocialShare.shareWhatsapp("For Share:\n" + itens).then((data)
              {
                print(data);
              });
            },
          )
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
      body: Scrollbar(
          child: Observer(builder:(BuildContext _context){
            _icontroller = Provider.of<ItemController>(_context);
            if(_icontroller.status == AppStatus.success){
              return ListView(
              padding: const EdgeInsets.symmetric(vertical: 10),
              children: [
                for (int i = 0; i < _listagem.length; i++)
                  ListTile(
                      leading: ExcludeSemantics(
                          child: CircleAvatar(child:Text('${i + 1}'),
                            backgroundColor: Color.fromRGBO(51,187,255,10),
                            foregroundColor: Colors.white,
                            maxRadius: 17,
                          )
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                          //Name of the bottons in the row
                          _listMeaning(i),
                          _listDelete(i),
                        ],
                      )
                  ),
              ],
            );
            }else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          })
        ),

      floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add_chart,color: Colors.white, size: 27),
              backgroundColor: Color.fromRGBO(0,136,204,10),
              onPressed: () => _displayDialog(), //_displayDialog is the fuction for create the new thing in the list
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

  //Label Name
  _listMeaning(int i)
  {
    return Expanded(
      child: Text(
          _listagem[i].meaning.toString(),
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 18,
            fontStyle: FontStyle.normal,
          )
      ),
    );
  }
  _listDelete(int i)
  {
    return IconButton(
      icon: Icon(
        Icons.delete_outline,
        size: 22.0,
        color: Colors.cyan,
      ),
      onPressed: (){
          _controller.delete(_listagem[i].id).then((data) {
            setState(() {
              _listagem = _controller.list;
            });
          });
      },
    );
  }

  //About the new item at the list
  _displayDialog() async {
    final context = _navigatorKey.currentState.overlay.context;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _themeaningController,
                          validator: (s) {
                            if (s.length < 2)
                              return "Please, type the item with less 2 character's";
                            else
                              return null;
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: "About my felling today",
                          )
                        ),
                      ],
                    )
                )
            ),
            actions: <Widget>[
              FlatButton(
                child: new Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: new Text('Save'),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _controller.create(Produto(
                          meaning: _themeaningController.text
                      ));
                    setState(() {
                      _listagem = _controller.list;
                      _themeaningController.text = "";
                    });
                    Navigator.of(context).pop();
                  }
                },
              )
            ],
          );
        });
  }
}
