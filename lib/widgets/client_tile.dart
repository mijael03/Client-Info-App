import 'package:flutter/material.dart';

import '../models/client.dart';

class ClientTile extends StatelessWidget {
  const ClientTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "A Client Name",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "72309504",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
