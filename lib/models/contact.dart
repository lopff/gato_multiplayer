class Contact {
  final String id;
  final String userId;
  final String contactId;
  final String name;
  final int totalWins;
  final int totalLoses;

  Contact(
      {this.id,
      this.userId,
      this.contactId,
      this.name,
      this.totalWins,
      this.totalLoses});

  Contact.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        userId = json['userId'],
        contactId = json['contactId'],
        name = json['name'],
        totalWins = json['totalWins'],
        totalLoses = json['totalLoses'];
}
