import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListSeparationBuilder extends StatefulWidget {
  const ListSeparationBuilder({super.key});

  @override
  State<ListSeparationBuilder> createState() => _ListSeparationBuilderState();
}

class _ListSeparationBuilderState extends State<ListSeparationBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List with Separation"),
      ),
      body: ListView.separated(itemBuilder: (context,position){
        return Card(
          child: Padding(padding: EdgeInsets.all(10),
          child: Text("Itembuilder $position"),
          ),
        );
      }, separatorBuilder: (context,position){
        return Card(
          child: Padding(padding: EdgeInsets.all(10),
            child: Text("Separator $position"),
          ),
        );
      }, itemCount: 20),
    );
  }
}
