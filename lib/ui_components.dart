import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UiComponents extends StatefulWidget {
  const UiComponents({super.key});

  @override
  State<UiComponents> createState() => _UiComponentsState();
}

class _UiComponentsState extends State<UiComponents> {
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("UI Components")),
      body: Padding(
        padding: EdgeInsets.all(16.0),

        child: Column(
          children: [
            Image(image: AssetImage('assets/images/img.png')),
            // Image.asset('assets/images/img.png'),  WORKING

            // Image.asset('assets/images/img.png"',
            //     height: 50,alignment: Alignment.center), NOT Working
            Text("Enter Details here",textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20,color: Color.alphaBlend(Colors.cyan, Colors.black)),),
            SizedBox(height: 10.0),
            TextFormField(
              validator: (value){
                if(value==null||value.isEmpty){
                  return "Add some Text";
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "Enter name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              decoration: InputDecoration(
                labelText: "Enter Email",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              decoration: InputDecoration(
                labelText: "Enter Contact",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: ()=>{
              Fluttertoast.showToast(msg: "This is my flutter toast")
            // Fluttertoast.showToast(
            // msg: 'GeeksforGeeks', // Message to display in the toast
            // backgroundColor: Colors.grey, // Background color of the toast
            //
            // );
            }, child: Text("Show Toast")),
            SizedBox(height: 10),
            OutlinedButton(onPressed: ()=>{
            if (_controller.text.isEmpty){
                ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Enter data correctly")))
              }
            }, child: Text("Outlined Button"))
          ],
        ),
      ),
    );
  }
}
