import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UiComponents extends StatefulWidget {
  const UiComponents({super.key});

  @override
  State<UiComponents> createState() => _UiComponentsState();
}

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // non cancellable
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('AlertDialog Title'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Image.asset("assets/images/img.png", height: 100, width: 100),
              Text('This is a demo alert dialog.'),
              Text('Would you like to approve of this message?'),
              TextField(
                decoration: InputDecoration(
                  labelText: "enter test data",
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class _UiComponentsState extends State<UiComponents> {
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("UI Components"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        leading: Icon(Icons.menu_book),
        actions: [
          IconButton(onPressed: ()=>{}, icon: Icon(Icons.search)),
          IconButton(onPressed: ()=>{}, icon: Icon(Icons.more_vert))
        ],

      ),
      body:
      SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),

        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage('assets/images/img.png'),width: MediaQuery.of(context).size.width * 0.4,),
                Image.network("https://picsum.photos/seed/picsum/200/300",width: MediaQuery.of(context).size.width *0.4),
                // CachedNetworkImage(
                //   placeholder: (context, url) => CircularProgressIndicator(),
                //   imageUrl: 'https://picsum.photos/200/300?grayscale',
                // ), Error - No implementation found for method getDatabasesPath on channel com.tekartik.sqflite
              ],
            ),
            // Image.asset('assets/images/img.png'),  WORKING

            // Image.asset('assets/images/img.png"',
            //     height: 50,alignment: Alignment.center), NOT Working
            Text(
              "Enter Details here",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Color.alphaBlend(Colors.cyan, Colors.black),
              ),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(onPressed: () {}, child: Text("validate Fields")),
                SizedBox(width: 10),
                Text("Filled Button"),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed:
                      () => {
                        Fluttertoast.showToast(msg: "This is my flutter toast"),
                        showDialog<String>(
                          context: context,
                          builder:
                              (BuildContext context) => AlertDialog(
                                title: const Text('AlertDialog Title'),
                                content: const Text('AlertDialog description'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed:
                                        () => Navigator.pop(context, 'Cancel'),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed:
                                        () => Navigator.pop(context, 'OK'),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                        ),

                        // Fluttertoast.showToast(
                        // msg: 'GeeksforGeeks', // Message to display in the toast
                        // backgroundColor: Colors.grey, // Background color of the toast
                        //
                        // );
                      },
                  child: Text("Show Toast and Dialog"),
                ),
                SizedBox(width: 10),
                Text("Elevated Button"),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed:
                      () => {
                        if (_controller.text.isEmpty)
                          {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Enter data correctly")),
                            ),
                          },
                      },
                  child: Text("Show Snackbar"),
                ),
                SizedBox(width: 10),
                Text("Outlined Button"),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: ()=> {
                    _showMyDialog(context)
                  },
                  child: Text("Show Alert through function"),
                ),
                SizedBox(width: 10),
                Text("Text Button"),
              ],
            ),
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton.tonal(onPressed: ()=>{}, child: Text("Filled Tonal")),
              Text("Filled Tonal Button")
            ],)
          ],
        ),
      ),
      ),
    );
  }
}
