import 'package:flutter/material.dart';

import 'helper/dbhelper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //insert dbHelper
  DbHelper _dbHelper = DbHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Api Demo",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: FutureBuilder(
        future: _dbHelper.getData(),
        builder: (context, snapshot) {
          //Kasih pesan error
          if (snapshot.hasError) {
            return Center(
              child: Text("Error : ${snapshot.error}"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return snapshot.hasData
              ? ItemList(list: snapshot.data)
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  List list;
  ItemList({required this.list, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Card(
            child: ListTile(
              title: Text(list[index]["nameproduct"]),
            ),
          ),
        );
      },
    );
  }
}
