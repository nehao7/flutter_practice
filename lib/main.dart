import 'package:flutter/material.dart';
import 'package:flutter_practice/CrudWithMultipleFields.dart';
import 'package:flutter_practice/ListSeparationBuilder.dart';
import 'package:flutter_practice/ListViewCrud.dart';
import 'package:flutter_practice/ListViewCustom.dart';
import 'package:flutter_practice/Listviewbuilder.dart';
import 'package:flutter_practice/MyGestureDetector.dart';
import 'package:flutter_practice/Mylistview.dart';
import 'package:flutter_practice/ToDoApp.dart';
import 'package:flutter_practice/file_screen.dart';
import 'package:flutter_practice/ui_components.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Future<void> handleFile() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/flutter_file.txt');

    await file.writeAsString('Saved from Flutter!');
    String content = await file.readAsString();

    print('File content: $content');
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    handleFile();
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(onPressed: ()=>{
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ListViewCustom()))
            }, child: Text("Custom List")),
            ElevatedButton(onPressed: ()=>{
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ListSeparationBuilder()))
            }, child: Text("List With Separation")),
            ElevatedButton(onPressed: ()=>{
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ListViewBuilder()))
            }, child: Text("List View builder")),
            ElevatedButton(onPressed: ()=>{
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Mylistview()))
            }, child: Text("List view")),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>UiComponents()));
            }, child: Text("UI Components")),
            ElevatedButton(onPressed:() {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FileScreen()));
            },
                child: Text('Go to File Handling Screen')),
            
            ElevatedButton(onPressed: ()=>{
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyGestureDetector()))
            }, child: Text("Gesture Detector")),
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton.tonal(onPressed: ()=>{
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ListViewCrud()))
                },
                    child: Text("List CRUD")),
              ],),
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton.tonal(onPressed: ()=>{
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> CrudWithMultipleFields()))
                },
                    child: Text("MultipleFields CRUD")),
              ],),
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton.tonal(onPressed: ()=>{
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ToDoApp()))
                },
                    child: Text("ToDo App")),
              ],)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
