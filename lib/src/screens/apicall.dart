import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../models/usermodal.dart';

class Apicall extends StatefulWidget {
  const Apicall({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ApicallState();
  }
}

class ApicallState extends State<Apicall> {
  @override
  void initState() {
    super.initState();
    //fetchData();
  }

  Future fetchData() async {
    try {
      var response =
          await Dio().get('https://jsonplaceholder.typicode.com/users');

      var data = response.data;
      List<UserModal> user = [];

      for (var i in data) {
        var usermodal = UserModal.fromJson(i);
        user.add(usermodal);
      }

      return user;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apicall'),
        centerTitle: true,
      ),
      body: Container(
        child: Card(
          //color: Colors.lightGreenAccen
          margin: const EdgeInsets.all(10),
          child: FutureBuilder(
            future: fetchData(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: const Center(
                    child: Text('Loading ....'),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, int index) {
                    return userDetail(snapshot.data[index]);
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget userDetail(UserModal user) {
    return Card(
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.lightGreenAccent),
          borderRadius: const BorderRadius.all(
              Radius.circular(10.0) //                 <--- border radius here
              ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  const TextSpan(
                    text: 'Name  : ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: '${user.name}',
                    style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black54,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  const TextSpan(
                    text: 'Email  : ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: '${user.email}',
                    style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black54,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  const TextSpan(
                    text: 'Username  : ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: '${user.userName}',
                    style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black54,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            // Text('Email :${user.email}'),
            // Text('UserName :${user.userName}'),
          ],
        ),
      ),
    );
  }
}
