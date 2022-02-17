import 'package:flutter/material.dart';

class NameCard extends StatelessWidget {
  const NameCard({
    Key? key,
    required this.myName,
    required TextEditingController nameController,
  })  : _nameController = nameController,
        super(key: key);

  final String myName;
  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(children: <Widget>[
      Image.asset("assets/Horsies.jpg"),
      const SizedBox(height: 20),
      Text(myName,
          style: const TextStyle(
              fontSize: 25,
              color: Colors.deepOrangeAccent,
              fontWeight: FontWeight.bold)),
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
            controller: _nameController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Name",
                hintText: "Write On Me!")),
      )
    ]));
  }
}
