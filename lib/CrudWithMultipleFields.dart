import 'package:flutter/material.dart';

class CrudWithMultipleFields extends StatefulWidget {
  const CrudWithMultipleFields({super.key});

  @override
  State<CrudWithMultipleFields> createState() => _CrudWithMultipleFieldsState();
}

class Person {
  String name;
  String email;

  Person({required this.name, required this.email});
}

class _CrudWithMultipleFieldsState extends State<CrudWithMultipleFields> {
  final List<Person> people = [];
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  void addPerson() {
    if (nameController.text.trim().isNotEmpty &&
        emailController.text.trim().isNotEmpty) {
      setState(() {
        people.add(
          Person(
            name: nameController.text.trim(),
            email: emailController.text.trim(),
          ),
        );
        nameController.clear();
        emailController.clear();
      });
    }
  }

  void editPerson(int index) {
    nameController.text = people[index].name;
    emailController.text = people[index].email;

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text('Edit Person'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    people[index].name = nameController.text.trim();
                    people[index].email = emailController.text.trim();
                  });
                  nameController.clear();
                  emailController.clear();
                  Navigator.of(context).pop();
                },
                child: Text('Save'),
              ),
            ],
          ),
    );
  }

  void deletePerson(int index) {
    setState(() {
      people.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CRUD with Multiple Fields')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                SizedBox(height: 10),
                ElevatedButton(onPressed: addPerson, child: Text('Add Person')),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: people.length,
              itemBuilder: (_, index) {
                final person = people[index];
                return Card(
                  child: Dismissible(
                    key: UniqueKey(),
                    background: Container(color: Colors.red),
                    onDismissed: (_) => deletePerson(index),
                    child: ListTile(
                      title: Text(person.name),
                      subtitle: Text(person.email),
                      onTap: () => editPerson(index),
                    ),
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
