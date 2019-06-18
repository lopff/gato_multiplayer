import 'package:flutter/material.dart';
import 'package:gato_multiplayer/services/services.dart';

class ChooseGameMode extends StatelessWidget {
  const ChooseGameMode({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthService _auth = AuthService();

    return Container(
      child: Scaffold(
        appBar:
            AppBar(title: Text('Juegos Activos o en Espera'), actions: <Widget>[
          Builder(builder: (BuildContext context) {
            return FlatButton(
              child: const Text('Regresar'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/ChooseGameMode');
              },
            );
          })
        ]),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GridView.count(),
              RaisedButton(
                child: Text("Multi Jugador"),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/PlayGameMultiPage');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
