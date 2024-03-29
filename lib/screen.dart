

import 'package:firebase/view_models/newes_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {

  @override
  Widget build(BuildContext context) {
    final pushN = Provider.of<NewsViewModel>(context);
    return Scaffold(
      appBar: AppBar(title:  Text("NOTIFICATION",style: TextStyle(color: Colors.red),),),
      body: Column(
        children: [
          for(var n in pushN.getPushNotifications() )
            Text("lkh"),

        ],
      ),
    );
  }
}
