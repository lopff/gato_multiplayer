class Game {
  final String id;
  final String user1;
  final String user2;
  final List<String> board;
  final int winner;

  Game({this.id, this.user1, this.user2, this.board, this.winner});

  Game.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        user1 = json['user1'],
        user2 = json['user1'],
        board = json['board'],
        winner = json['winner'];
}
