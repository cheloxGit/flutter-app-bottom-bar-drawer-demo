import 'package:appBarBottom/utils/constants.dart';
import 'package:appBarBottom/views/viva.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Title'),
      routes: <String, WidgetBuilder>{
        VIVA_UI: (BuildContext context) => Viva(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> cards = List<Widget>();
  buildCard(String label, String screen) {
    return GestureDetector(
      onTap: () {
        print('Presed: $label');

        Navigator.pushNamed(context, screen);
      },
      child: Card(
        elevation: 5,
        color: Colors.red,
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 17.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    cards.add(
      buildCard(
        'Viva',
        VIVA_UI,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                child: Text('Avatar'),
              ),
            ),
            ListTile(
                title: Text('Viva'),
                leading: Icon(Icons.dashboard),
                onTap: () => {
                      Navigator.pop(context),
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Viva()))
                    }),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 1,
        children: [for (int i = 0; i < cards.length; i++) cards[i]],
      ),
      bottomNavigationBar: Container(
        height: 55.0,
        child: BottomAppBar(
          color: Colors.red,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            IconButton(
              icon: Icon(Icons.dashboard),
              color: Colors.white,
              onPressed: () => {
                Navigator.pop(context),
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => Viva(),
                  ),
                ),
              },
            ),
          ]),
        ),
      ),
    );
  }
}
