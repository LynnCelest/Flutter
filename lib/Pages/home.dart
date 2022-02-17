import 'package:flutter/material.dart';
import 'package:heaven/Utils/constants.dart';
import 'package:heaven/drawer.dart';
import 'package:heaven/Pages/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static const String routeName = "/login";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // var myName = "Change My Name";
  // final TextEditingController _nameController = TextEditingController();
  Uri url = Uri.parse("https://jsonplaceholder.typicode.com/photos");
  dynamic data = "";
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  fetchData() async {
    var res = await http.get(url);
    data = jsonDecode(res.body);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: const Text("Awesome App"), actions: <Widget>[
        IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              Constants.prefs!.setBool("loggedIn", false);
              Navigator.pushReplacementNamed(context, Login.routeName);
            })
      ]),
      body: data != ""
          ? //ListView.builder(
          GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) => ListTile(
                  title: Text(
                    data[index]["title"],
                  ),
                  subtitle: Text("ID: ${data[index]["id"]}"),
                  leading: Image.network(data[index]["url"])),
              itemCount: data.length,
            )
          : const Center(child: CircularProgressIndicator()),
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            //myName = _nameController.text;
            setState(() {});
          },
          child: const Icon(Icons.send)),
    );
  }
}

//import 'package:heaven/namecard.dart';
// const Center(
//           child: Padding(
//         padding: EdgeInsets.all(16.0),
              // child: SingleChildScrollView(
              //   child:
              //       NameCard(myName: myName, nameController: _nameController),
              // ))),

        // body: Container(
        //     color: Colors.black,
        //     child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //         crossAxisAlignment: CrossAxisAlignment.stretch,
        //         children: <Widget>[
        //           Container(
        //             padding: const EdgeInsets.all(8),
        //             color: Colors.pink,
        //             width: 100,
        //             height: 100,
        //             alignment: Alignment.center,
        //           ),
        //           Container(
        //             padding: const EdgeInsets.all(8),
        //             color: Colors.purple,
        //             width: 100,
        //             height: 100,
        //             alignment: Alignment.center,
        //           ),
        //           Container(
        //             padding: const EdgeInsets.all(8),
        //             color: Colors.amber,
        //             width: 100,
        //             height: 100,
        //             alignment: Alignment.center,
        //           )
        //         ])));
// Center(
//             child: Container(
//                 padding: const EdgeInsets.all(8),
//                 //color: Colors.red,
//                 width: 100,
//                 height: 100,
//                 clipBehavior: Clip.antiAlias,
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                   color: Colors.red,
//                   borderRadius: BorderRadius.circular(10),
//                   boxShadow: const [
//                     BoxShadow(
//                       blurRadius: 5,
//                       color: Colors.grey,
//                     )
//                   ],
//                   gradient: const LinearGradient(colors: [
//                     Colors.pink,
//                     Colors.yellow,
//                   ]),
//                   //shape: BoxShape.circle),
//                 ),
//                 child: const Text("I am a box",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     )))

// runApp(MaterialApp(
//       home: Container(
//     color: Colors.amber,
//     child: Text("Hi Flutter"),
//   )));