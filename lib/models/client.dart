import 'package:hive/hive.dart';
part 'client.g.dart';

@HiveType(typeId: 0)
class Client extends HiveObject {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late String state;
  @HiveField(2)
  late String dni;
  @HiveField(3)
  late String email;
  @HiveField(4)
  late String password;
  @HiveField(5)
  late String phone;
  @HiveField(6)
  late int age;
  @HiveField(7)
  late DateTime date;
}
