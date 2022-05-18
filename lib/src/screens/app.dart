import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/imagemodel.dart';
import 'dart:convert';
import '../widgets/imagelist.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  // const App({Key? key}) : super(key: key);
  int counter = 0;
  List<ImageModel> images = [];

  @override
  void initState() {
    super.initState();
    //fetchImage();
  }

  void fetchImage() async {
    counter++;
    var result = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos/$counter'));
    var parsedJson = json.decode(result.body);
    var imageModel = ImageModel.fromJson(parsedJson);

    setState(() {
      images.add(imageModel);
    });
  }

  // void navigation(){
  //   Navigator.push(context, )
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      title: 'Demo App',
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: fetchImage,
          // () {
          //   setState(() {
          //     counter = counter + 1;
          //   });
          // },
        ),
        appBar: AppBar(
          // primary: false,
          // centerTitle: true,
          title: const Text(
            'Demo App',
            style: TextStyle(
                fontFamily: 'Manrope',
                fontWeight: FontWeight.bold,
                color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        body: ImageList(images),
        // Container(
        //   padding: const EdgeInsets.only(left: 40),
        //   child: Text(
        //     'Counter value is : $counter',
        //     style: const TextStyle(
        //       fontSize: 20,
        //     ),
        //     textAlign: TextAlign.center,
        //   ),
        // ),
      ),
    );
  }
}
