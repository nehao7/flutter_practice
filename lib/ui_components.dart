

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UiComponents extends StatefulWidget {
  const UiComponents({super.key});

  @override
  State<UiComponents> createState() => _UiComponentsState();
}

class _UiComponentsState extends State<UiComponents> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("UI Components"),),
      body: Center(
        child: Column(
          children: [
            TextField(controller: _controller,
            decoration: ,
            )
          ],
        )
      ),
    );
  }
}
