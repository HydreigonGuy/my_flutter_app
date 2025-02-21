import 'package:flutter/material.dart';
import 'runner.dart';
import 'hunter.dart';
import 'mine.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child : ElevatedButton(
                onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => RunnerGamePage()
                        )
                    );
                },
                child: Text('Runner'),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child : ElevatedButton(
                onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => HunterGamePage()
                        )
                    );
                },
                child: Text('Hunter'),
            ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child : ElevatedButton(
                onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => MineGamePage()
                        )
                    );
                },
                child: Text('Mine Sweep'),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
