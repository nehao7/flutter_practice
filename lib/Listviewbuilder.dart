import 'package:flutter/material.dart';
import 'package:flutter_practice/ListBuilderWithClick.dart';

class ListViewBuilder extends StatefulWidget {
  const ListViewBuilder({super.key});

  @override
  State<ListViewBuilder> createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List view builder")),
      body: Column(
        children: [
          OutlinedButton(
            onPressed:
                () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListBuilderWithClick(),
                    ),
                  ),
                },
            child: Text("clickable list"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, position) {
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      position.toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


// Expanded(
// child: ListView(...)
// )

// Same idea as Expanded but allows more flexible behavior
// Flexible(
// child: ListView(...)
// )

// Give it a fixed height (not scrollable by default)
// SizedBox(
// height: 300,
// child: ListView(...),
// )