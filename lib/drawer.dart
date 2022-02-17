import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: const EdgeInsets.all(0), children: <Widget>[
      const UserAccountsDrawerHeader(
          accountName: Text(
            "Lynn Celestine",
            style: TextStyle(color: Colors.amber),
          ),
          accountEmail: Text(
            "LynnCelestine2@gmail.com",
            style: TextStyle(color: Colors.amber),
          ),
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://scontent-lga3-2.xx.fbcdn.net/v/t1.6435-9/70452621_745113332610721_3442681678068187136_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=djc-jo-CoAAAX-FxJqW&_nc_ht=scontent-lga3-2.xx&oh=00_AT8n6MwtS7dkcvrJeiMpMHxE_mWOOe9fpMToSRCzq9lYDg&oe=62247137"),
          ),
          decoration: BoxDecoration(
            color: Colors.purple,
          )),
      ListTile(
        leading: const Icon(Icons.person),
        title: const Text("Lynn Celestine"),
        subtitle: const Text("Developer"),
        trailing: const Icon(Icons.edit),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.mail),
        title: const Text("Email"),
        subtitle: const Text("LynnCelestine2@gmail.com"),
        trailing: const Icon(Icons.edit),
        onTap: () {},
      )
    ]));
  }
}
