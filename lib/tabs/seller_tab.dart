import 'package:flutter/material.dart';

class PlacesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        alignment: Alignment.center,
        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('500,00', style: TextStyle(color: Colors.lightBlue, fontSize: 64.0),),
            Text('VENDAS', style: TextStyle(color: Colors.lightBlue, fontSize: 14.0,)),
          ],
        ),
      ),
    );
  }
}
