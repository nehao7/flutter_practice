import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewCrud extends StatefulWidget {
  const ListViewCrud({super.key});

  @override
  State<ListViewCrud> createState() => _ListViewCrudState();
}


class _ListViewCrudState extends State<ListViewCrud> {
  final List<String> items = [];
  final TextEditingController controller = TextEditingController();

  void addItem() {
    if (controller.text.trim().isNotEmpty) {
      setState(() {
        items.add(controller.text.trim());
        controller.clear();
      });
    }
  }


  void editItem(int index) {
    controller.text = items[index];
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Edit Item'),
        content: TextField(
          controller: controller,
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                items[index] = controller.text.trim();
                controller.clear();
              });
              Navigator.of(context).pop();
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  void deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple CRUD List')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: 'Enter item',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: addItem,
                  child: Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (_, index) {
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.red),
                  onDismissed: (_) => deleteItem(index),
                  child: ListTile(
                    title: Text(items[index]),
                    onTap: () => editItem(index),
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