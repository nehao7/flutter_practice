import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarFeatures extends StatefulWidget {
  const AppBarFeatures({super.key});

  @override
  State<AppBarFeatures> createState() => _AppBarFeaturesState();
}

class _AppBarFeaturesState extends State<AppBarFeatures> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appbar"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        elevation: 4,
        leading: Icon(Icons.menu, size: 28,color: Colors.white),
        actions: [
          IconButton(onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("My Notification Snackbar")));
          }, 
              icon: Icon(Icons.notifications)),
        IconButton(onPressed: (){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("My Settings Snackbar")));
        }, icon: Icon(Icons.settings))
        ],
      ),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,  // vertical spacing
        crossAxisAlignment: CrossAxisAlignment.center,     // Horizontal alignment
        mainAxisSize: MainAxisSize.max,                    // Takes up all vertical space
        verticalDirection: VerticalDirection.down,         // From top to bottom
        textDirection: TextDirection.ltr,                  // Left to right (default)
        children: [
          Text("Above Row "),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(Icons.home, color: Colors.blue),
              Text("Center"),
              Icon(Icons.settings, color: Colors.red),
            ],
          ),
          Text("Below Row"),
        ],
      ),),
    );
  }
}
