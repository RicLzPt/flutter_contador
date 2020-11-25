import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Contador de Pessoas",
    home: Home(),
    theme: ThemeData.light(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _infoText = "Pode entrar!";

  void _changePeople(int delta) {
    setState(() {
      if (_people <= 0 && delta == -1) {
        _people = 0;
        _infoText = "Pode entrar!";
      } else if (_people <= 0 && delta == 1) {
        _people += delta;
        _infoText = "Pode entrar!";
      } else if (_people >= 0 && _people < 10) {
        _people += delta;
        _infoText = "Pode entrar!";
      } else if (_people >= 10 && delta == 1) {
        _people = 10;
        _infoText = "Lotado!";
      } else if (_people >= 10 && delta == -1) {
        _people += delta;
        _infoText = "Pode entrar!";
      }

      if(_people == 10){
        _infoText = "Lotado!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        "images/restaurant.jpg",
        fit: BoxFit.cover,
        height: MediaQuery.of(context).size.height,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Pessoas: $_people",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlatButton(
                    child: Text(
                      "+1",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        this._changePeople(1);
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlatButton(
                    child: Text(
                      "-1",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _changePeople(-1);
                      });
                    },
                  ),
                ),
              ],
            ),
            Text(
              "$_infoText",
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    ]);
  }
}
