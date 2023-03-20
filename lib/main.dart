import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String data = "Nothing";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Tambah Data"),
                content: Text("Apakah ingin mengubah data?"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop("No");
                      },
                      child: Text("No")),
                  ElevatedButton(
                      onPressed: () {
                        //Navigator.of(context).pop();
                        Navigator.pop(context, "Data Diubah");
                      },
                      child: Text("Yes")),
                ],
              );
            },
          ).then((value) {
            setState(() {
              data = value;
            });
          });
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Dialog"),
      ),
      body: Center(
        child: Text(
          data,
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
