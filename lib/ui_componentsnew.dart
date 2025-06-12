import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/app_bar_features.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UiComponents extends StatefulWidget {
  const UiComponents({super.key});

  @override
  State<UiComponents> createState() => _UiComponentsState();
}

class _UiComponentsState extends State<UiComponents> {
  final TextEditingController _controller = TextEditingController();
  bool _validate = false;
  double _sliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UI Components"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        leading: Icon(Icons.menu_book),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () => {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/images/img.png'),
                      width: MediaQuery.of(context).size.width * 0.4,
                    ),
                    Image.network(
                      "https://picsum.photos/seed/picsum/200/300",
                      width: MediaQuery.of(context).size.width * 0.4,
                    ),
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
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: "Enter name",
                    border: OutlineInputBorder(),
                    errorText: _validate ? "Name Value required" : null,
                  ),
                ),
                SizedBox(height: 10.0),
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: "Enter Email",
                    border: OutlineInputBorder(),
                    errorText: _validate ? "Email Value required" : null,
                  ),
                ),
                SizedBox(height: 10.0),
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: "Enter Contact",
                    border: OutlineInputBorder(),
                    errorText: _validate ? "Contact Value required" : null,
                  ),
                ),
                SizedBox(height: 20),
                Slider(
                  value: _sliderValue,
                  min: 0,
                  // Minimum value
                  max: 100,
                  // Maximum value
                  divisions: 20,
                  // Number of discrete divisions
                  label: _sliderValue.round().toString(),
                  // Tooltip
                  activeColor: Colors.blue,
                  // Color of the filled track
                  inactiveColor: Colors.grey,
                  // Color of the unfilled track
                  thumbColor: Colors.red,
                  // Color of the thumb (requires SliderTheme)
                  onChanged: (double value) {
                    setState(() {
                      _sliderValue = value;
                    });
                  },
                  onChangeStart: (value) {
                    print('Slider started at $value');
                  },
                  onChangeEnd: (value) {
                    print('Slider stopped at $value');
                  },
                  // secondaryTrackValue: 50, // for `RangeSlider`, not `Slider`
                ),
                SizedBox(height: 20),
                Text(
                  'Value: ${_sliderValue.toStringAsFixed(1)}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilledButton(
                      onPressed: () {
                        setState(() {
                          _controller.text.isEmpty
                              ? _validate = true
                              : _validate = false;
                        });
                      },
                      child: Text("Validate Fields"),
                    ),
                    SizedBox(width: 10),
                    Text("Filled Button"),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Fluttertoast.showToast(msg: "This is my flutter toast");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AppBarFeatures(),
                          ),
                        );
                      },
                      child: Text("Appbar Screen"),
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
                      onPressed: () => {
                        if (_controller.text.isEmpty)
                          {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("My validate Snackbar action"),
                                action: SnackBarAction(
                                  label: 'Undo',
                                  textColor: Colors.indigo,
                                  onPressed: () {
                                    Fluttertoast.showToast(
                                      msg: "Toast invoked by snackbar",
                                    );
                                  },
                                ),

                                backgroundColor: Colors.black26,
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    12,
                                  ),
                                ),
                                duration: Duration(seconds: 4),
                                animation: CurvedAnimation(
                                  parent: kAlwaysCompleteAnimation,
                                  // static animation for demo
                                  curve: Curves.bounceInOut,
                                ),
                                dismissDirection: DismissDirection.horizontal,
                                onVisible: () {
                                  print('Snackbar is visible');
                                },
                              ),
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

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     TextButton(
                //       onPressed: ()=> {
                //         _showMyDialog(context)
                //       },
                //       child: Text("Show Alert through function"),
                //     ),
                //     SizedBox(width: 10),
                //     Text("Text Button"),
                //   ],
                // ),
                // SizedBox(height: 10),
                // Row(mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     FilledButton.tonal(onPressed: ()=>{
                //       Navigator.push(context, MaterialPageRoute(builder: (context)=> MyFormFields()))
                //     },
                //         child: Text("Filled Tonal")),
                //   ],),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
