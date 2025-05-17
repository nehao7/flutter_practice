import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/SQFLiteHelper.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {

  final textEditingController= TextEditingController();
  final helper= SQFLiteHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Todo App')),
        body: FutureBuilder(
          //helper.getTasks() returns a Future<List<Map<String, dynamic>>>.
            future: helper.getTasks(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                //snapshot.data is the list of tasks that we get from the database.
                return ListView.builder(
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return ListTile(
                          leading: Checkbox(
                              value: snapshot.data?[index]['status'] == 1
                                  ? true
                                  : false,
                              onChanged: (value) async {
                                //updateTask method takes the id of the task and the status to be updated.
                                await helper.updateTask(
                                    snapshot.data?[index]['id'], value!);
                                setState(() {});
                              }),
                          title: Text(snapshot.data?[index]['title']),
                          trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () async {
                                await helper
                                    .deleteTask(snapshot.data?[index]['id']);
                                //setState is used to update the UI.
                                setState(() {});
                              }));
                    });
              }
              return const Center(child: CircularProgressIndicator());
            }),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        title: Text('Add Task'),
                        content: TextField(
                            autofocus: true,
                            controller: textEditingController,
                            decoration:  InputDecoration(
                              hintText: 'Enter title',
                            )),
                        actions: [
                          TextButton(
                              onPressed: () {
                                //Navigator.pop is used to close the dialog box.
                                Navigator.pop(context);
                              },
                              child: Text('Cancel')),
                          TextButton(
                              onPressed: () async {
                                await helper.insertTask(
                                    textEditingController.text, false);
                                //clear is used to clear the text field.
                                textEditingController.clear();
                                if (context.mounted) {
                                  Navigator.pop(context);
                                }
                                //setState is used to update the UI.
                                setState(() {});
                              },
                              child: const Text('Add'))
                        ]);
                  });
            },
            child: const Icon(Icons.add)
        )
    );
  }
}
