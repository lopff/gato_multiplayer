import 'package:gato_multiplayer/models/models.dart';
import 'services.dart';

/// Static global state. Immutable services that do not care about build context.
class Global {
  // App Data
  static final String title = 'Gato Multiplayer';

  // Services
  //static final FirebaseAnalytics analytics = FirebaseAnalytics();

  // Data Models
  /*static final Map models = {
    User: (id, data) => User.fromMap(data),
    Contact: (id, data) => Contact.fromMap(id, data),
    Game: (id, data) => Game.fromMap(id, data),
  };*/
/*
  static final Map modelsToJson = {
    UserTickets: (data) => UserTickets.userTicketToJson(data),
    Address: (data) => Address.addressToJson(data),
  };

  // Firestore References for Writes
  static final Collection<UserTickets> userTicketsRef =
      Collection<UserTickets>(path: 'UserTickets');

  static final Document<Address> addressRef =
      Document<Address>(path: 'Addresses');
  static final Collection<Address> addressesRef =
      Collection<Address>(path: 'Addresses');*/
}
