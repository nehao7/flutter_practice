import 'package:flutter/material.dart';

class Mylistview extends StatefulWidget {
  const Mylistview({super.key});

  @override
  State<Mylistview> createState() => _MylistviewState();
}

class _MylistviewState extends State<Mylistview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List View")),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          CircleAvatar(
            maxRadius: 50,
            backgroundColor: Colors.black,
            child: Icon(Icons.person, color: Colors.white, size: 50),
          ),
          Center(child: Text('Sooraj S Nair', style: TextStyle(fontSize: 50))),
          Center(child: Text("MY TEXT 1", style: TextStyle(fontSize: 20))),
          Center(child: Text("My Text 2", style: TextStyle(fontSize: 20,
                backgroundColor: Colors.cyanAccent,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),

          ListView.builder(
            itemCount: 20,
            itemBuilder: (context, position) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    position.toString(),
                    style: TextStyle(fontSize: 22.0),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
