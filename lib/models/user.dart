class User {
  final String id;
  final String name;
  final int totalWins;
  final int totalLoses;

  User({this.id, this.name, this.totalWins, this.totalLoses});

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        totalWins = json['totalWins'],
        totalLoses = json['totalLoses'];
}
