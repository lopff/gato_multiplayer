import 'package:flutter/material.dart';
import 'package:gato_multiplayer/services/services.dart';

class ChooseGameMode extends StatelessWidget {
  const ChooseGameMode({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthService _auth = AuthService();

    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('Elige Modo de Juego'), actions: <Widget>[
          Builder(builder: (BuildContext context) {
            return FlatButton(
              child: const Text('Salir'),
              onPressed: () async {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('Redireccionando a Login.'),
                ));
                await _auth.signOut();
                Navigator.pushReplacementNamed(context, '/SignInPage');
              },
            );
          })
        ]),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                child: Text("Solo"),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/PlayGamePage');
                },
              ),
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
