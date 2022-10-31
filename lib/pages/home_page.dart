import 'package:clientinfo/pages/add_client.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../boxes.dart';
import '../models/client.dart';

class ClientPage extends StatefulWidget {
  @override
  _ClientPageState createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  @override
  void dispose() {
    Hive.box('clients').close();
    // TODO: implement dispose
    super.dispose();
  }

  Future addTransaction(String name, String state, String dni, String email,
      String password, String phone, int age) async {
    final client = Client()
      ..name = name
      ..state = state
      ..dni = dni
      ..email = email
      ..password = password
      ..phone = phone
      ..age = age
      ..date = DateTime.now();
    final box = Boxes.getClients();
    box.add(client);
    //box.put('mykey', transaction);

    // final mybox = Boxes.getTransactions();
    // final myTransaction = mybox.get('key');
    // mybox.values;
    // mybox.keys;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(180, 31, 28, 28),
      appBar: AppBar(
        title: const Text(
          'Client List',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: ValueListenableBuilder<Box<Client>>(
        valueListenable: Boxes.getClients().listenable(),
        builder: (context, box, _) {
          final clients = box.values.toList().cast<Client>();

          return buildContent(clients);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddClient(
                        onClickedDone: addTransaction,
                      )));
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildContent(List<Client> clients) {
    if (clients.isEmpty) {
      return const Center(
        child: Text(
          'No expenses yet!',
          style: TextStyle(fontSize: 24),
        ),
      );
    } else {
      return Column(
        children: [
          const SizedBox(height: 24),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: clients.length,
              itemBuilder: (BuildContext context, int index) {
                final transaction = clients[index];
                if (index == clients.length - 1) {
                  print(index);
                  return buildTransaction(context, transaction, true);
                }
                return buildTransaction(context, transaction, false);
              },
            ),
          ),
        ],
      );
    }
  }

  Widget buildTransaction(BuildContext context, Client client, bool isLast) {
    print(client.dni);
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: isLast ? Colors.black : Colors.green,
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (!isLast)
              Image.network(
                "https://cdn-icons-png.flaticon.com/512/891/891448.png",
                height: 40,
              ),
            Text(
              client.name,
              style: TextStyle(color: Colors.white),
            ),
            Text(
              client.phone,
              style: TextStyle(color: Colors.white),
            ),
            isLast
                ? Text(
                    client.state,
                    style: TextStyle(color: Colors.white),
                  )
                : Text("${client.state} - new")
          ],
        ),
      ),
    );
  }
}
