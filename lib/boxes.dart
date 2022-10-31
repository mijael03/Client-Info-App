import 'package:hive/hive.dart';

import 'models/client.dart';

class Boxes {
  static Box<Client> getClients() => Hive.box<Client>('clients');
}
