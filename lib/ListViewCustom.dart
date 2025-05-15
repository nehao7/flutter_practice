import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewCustom extends StatefulWidget {
  const ListViewCustom({super.key});

  @override
  State<ListViewCustom> createState() => _ListViewCustomState();
}

class _ListViewCustomState extends State<ListViewCustom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom List"),
      ),
      body: Center(
        child: Padding(padding: EdgeInsets.all(10),
        child:Row(
          children: [
            ListView.custom(childrenDelegate:
    SliverChildBuilderDelegate((BuildContext context, int index){
      return Card(
        child: ListTile(
        leading: Icon(Icons.person),
        title: Text("Item $index"),
      )
      );
    }),
        ),
            FloatingActionButton(onPressed: ()=>{

            },child: Icon(Icons.add),)
      ]),
        )
      )
    );
  }
}
