import 'package:flutter/material.dart';
import 'package:gato_multiplayer/screens/game/game_button.dart';
import 'package:gato_multiplayer/screens/game/custom_dialog.dart';

class PlayGamePage extends StatefulWidget {
  PlayGamePage({Key key, this.title = "Gato-Solo"}) : super(key: key);

  final String title;

  @override
  _PlayGamePageState createState() => _PlayGamePageState();
}

class _PlayGamePageState extends State<PlayGamePage> {
  List<GameButton> buttonsList;
  var activePlayer;

  int buttonsChecked = 0;

  @override
  void initState() {
    super.initState();
    buttonsList = initializeButtonListandPlayers();
  }

  List<GameButton> initializeButtonListandPlayers() {
    activePlayer = 1;
    buttonsChecked = 0;

    var gameButtons = <GameButton>[
      new GameButton(id: 1),
      new GameButton(id: 2),
      new GameButton(id: 3),
      new GameButton(id: 4),
      new GameButton(id: 5),
      new GameButton(id: 6),
      new GameButton(id: 7),
      new GameButton(id: 8),
      new GameButton(id: 9),
    ];
    return gameButtons;
  }

  void play(GameButton gameButton) {
    if (gameButton.enabled) {
      setState(() {
        buttonsChecked++;
        gameButton.enabled = false;
        if (activePlayer == 1) {
          gameButton.backgroundColor = Colors.blue;
          gameButton.text = "X";
          activePlayer = 2;
        } else {
          gameButton.backgroundColor = Colors.green;
          gameButton.text = "O";
          activePlayer = 1;
        }

        String winner = buttonsChecked > 3 ? checkWinner() : "";
        if (winner == "" && buttonsChecked == 9) winner = "tied";
        if (winner.length > 0)
          showDialog(
              context: context,
              builder: (_) => CustomDialog(
                  winner == "X"
                      ? "Jugador 1 ganó"
                      : winner == "O" ? "Jugador 2 ganó" : "Juego empatado",
                  "Presione reiniciar.",
                  resetGame));
      });
    }
  }

  String checkWinner() {
    if (buttonsList[0].text.length > 0 &&
        buttonsList[0].text == buttonsList[1].text &&
        buttonsList[1].text == buttonsList[2].text) return buttonsList[0].text;
    if (buttonsList[3].text.length > 0 &&
        buttonsList[3].text == buttonsList[4].text &&
        buttonsList[4].text == buttonsList[5].text) return buttonsList[3].text;
    if (buttonsList[6].text.length > 0 &&
        buttonsList[6].text == buttonsList[7].text &&
        buttonsList[7].text == buttonsList[8].text) return buttonsList[6].text;

    if (buttonsList[0].text.length > 0 &&
        buttonsList[0].text == buttonsList[3].text &&
        buttonsList[3].text == buttonsList[6].text) return buttonsList[0].text;
    if (buttonsList[1].text.length > 0 &&
        buttonsList[1].text == buttonsList[4].text &&
        buttonsList[4].text == buttonsList[7].text) return buttonsList[1].text;
    if (buttonsList[2].text.length > 0 &&
        buttonsList[2].text == buttonsList[5].text &&
        buttonsList[5].text == buttonsList[8].text) return buttonsList[2].text;

    if (buttonsList[0].text.length > 0 &&
        buttonsList[0].text == buttonsList[4].text &&
        buttonsList[4].text == buttonsList[8].text) return buttonsList[0].text;
    if (buttonsList[2].text.length > 0 &&
        buttonsList[2].text == buttonsList[4].text &&
        buttonsList[4].text == buttonsList[6].text) return buttonsList[2].text;
    return "";
  }

  void resetGame() {
    if (Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      buttonsList = initializeButtonListandPlayers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), actions: <Widget>[
        FlatButton(
          child: const Text('Regresar'),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, '/ChooseGameMode'),
        )
      ]),
      body: Center(
        child: GridView.count(
          padding: EdgeInsets.all(10),
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          crossAxisSpacing: 9.0,
          mainAxisSpacing: 9.0,
          children: List.generate(buttonsList.length, (i) {
            return SizedBox(
              width: 100.0,
              height: 100.0,
              child: new RaisedButton(
                padding: const EdgeInsets.all(8.0),
                onPressed:
                    buttonsList[i].enabled ? () => play(buttonsList[i]) : null,
                child: new Text(
                  buttonsList[i].text,
                  style: new TextStyle(color: Colors.white, fontSize: 80.0),
                ),
                color: buttonsList[i].backgroundColor,
                disabledColor: buttonsList[i].backgroundColor,
              ),
            );
          }),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          child: IconButton(
        icon: Icon(Icons.refresh),
        iconSize: 100,
        tooltip: 'Reiniciar juego',
        onPressed: () {
          resetGame();
        },
      )),
    );
  }
}
