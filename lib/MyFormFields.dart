import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyFormFields extends StatefulWidget {
  const MyFormFields({super.key});

  @override
  State<MyFormFields> createState() => _MyFormFieldsState();
}

class _MyFormFieldsState extends State<MyFormFields> {
  final  _formKey=GlobalKey<FormState>();
  var name="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Fields"),),
      body: Padding(padding: EdgeInsets.all(10),
        key: _formKey ,
        child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Enter name",
                  ),
                  onSaved: (value)=> name=value!,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  }),

                ElevatedButton(onPressed: ()=>{
                  if(_formKey.currentState!.validate()){
                    _formKey.currentState?.save()
                  }
                }, child: Text("Validate Form"))
              ],
            )
        ),

      ),
    );
  }
}
