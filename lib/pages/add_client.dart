import 'package:clientinfo/models/client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../boxes.dart';

class AddClient extends StatefulWidget {
  final Function(String name, String state, String dni, String email,
      String password, String phone, int age) onClickedDone;
  const AddClient({super.key, required this.onClickedDone});

  @override
  State<AddClient> createState() => _AddClientState();
}

class _AddClientState extends State<AddClient> {
  final _formKey = GlobalKey<FormState>();
  final List<Client> clients = [];
  var state = ['Soltero', 'Casado', 'Viudo', 'Divorciado'];
  var initialstate = 'Estado Civil';
  final namecontroller = TextEditingController();
  final dnicontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final agecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(180, 31, 28, 28),
      appBar: AppBar(
        title: const Text(
          'Add Client',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: namecontroller,
              decoration: const InputDecoration(
                  hintText: "Name",
                  focusedBorder: OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide: BorderSide(
                        width: 3, color: Color.fromARGB(255, 248, 76, 63)),
                  ),
                  errorStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 248, 76, 63))),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Eres cuma ';
                }
                return null;
              },
            ),
            DropdownButtonFormField(
              hint: const Text("Estado civil"),
              dropdownColor: Color.fromARGB(219, 126, 122, 122),
              items: state.map((String st) {
                return DropdownMenuItem(
                    value: st,
                    child: Text(
                      st,
                    ));
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  initialstate = newValue!;
                });
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: const InputDecoration(
                  hintText: "DNI",
                  focusedBorder: OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide: BorderSide(
                        width: 3, color: Color.fromARGB(255, 248, 76, 63)),
                  ),
                  errorStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 248, 76, 63))),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value!.length != 8 || value.isEmpty) {
                  return 'pon un dni valido';
                }
                return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  hintText: "Email",
                  focusedBorder: OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide: BorderSide(
                        width: 3, color: Color.fromARGB(255, 248, 76, 63)),
                  ),
                  errorStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 248, 76, 63))),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null ||
                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                  return 'pon un email valido';
                }
                return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(
                  hintText: "Contraseña",
                  focusedBorder: OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide: BorderSide(
                        width: 3, color: Color.fromARGB(255, 248, 76, 63)),
                  ),
                  errorStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 248, 76, 63))),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 6) {
                  return 'tienes que poner una contraseña valida';
                }
                return null;
              },
            ),
            TextFormField(
              controller: phonecontroller,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: const InputDecoration(
                  hintText: "Phone",
                  focusedBorder: OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide: BorderSide(
                        width: 3, color: Color.fromARGB(255, 248, 76, 63)),
                  ),
                  errorStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 248, 76, 63))),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null && value![0] == "9" && value.length != 9) {
                  print(value![0]);
                  print("jajajajaja");
                  print(value.length);
                  return 'pon un numero de celular valido';
                }
                return null;
              },
            ),
            TextFormField(
              controller: agecontroller,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: const InputDecoration(
                  hintText: "Age",
                  focusedBorder: OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide: BorderSide(
                        width: 3, color: Color.fromARGB(255, 248, 76, 63)),
                  ),
                  errorStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 248, 76, 63))),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'campo obligatorio';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    widget.onClickedDone(
                        namecontroller.text,
                        initialstate,
                        dnicontroller.text,
                        emailcontroller.text,
                        passwordcontroller.text,
                        phonecontroller.text,
                        int.parse(agecontroller.text));
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
