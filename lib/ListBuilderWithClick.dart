import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListBuilderWithClick extends StatefulWidget {
  const ListBuilderWithClick({super.key});

  @override
  State<ListBuilderWithClick> createState() => _ListBuilderWithClickState();
}

class _ListBuilderWithClickState extends State<ListBuilderWithClick> {
  final List<Map<String, String>> items = List.generate(
    10,
        (index) => {
      'title': 'Item ${index + 1}',
      'subtitle': 'Subtitle ${index + 1}',
      'description': 'This is a detailed description for item ${index + 1}',
    },
  );
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Custom ListView')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          var item = items[index];
          return GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Clicked on ${item['title']}')),
              );
            },
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              elevation: 3,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item['title']!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 6),
                    Text(item['subtitle']!, style: TextStyle(fontSize: 16, color: Colors.grey[700])),
                    SizedBox(height: 6),
                    Text(item['description']!, style: TextStyle(fontSize: 14)),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Clicked button in ${item['title']}')),
                          );
                        },
                        child: Text('Action'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}