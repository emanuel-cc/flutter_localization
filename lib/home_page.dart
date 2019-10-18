import 'package:flutter/material.dart';
import 'package:internazionalization/idioma_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            color: Colors.black,
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context){
                  return IdiomasPage();
                }
              ));
            },
          ),
        ],
      ),
    );
  }
}