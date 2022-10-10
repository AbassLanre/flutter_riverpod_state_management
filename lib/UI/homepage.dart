import 'package:flutter/material.dart';
import 'package:flutter_riverpod_state_management/UI/counterpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const CounterPage()));
            },
            child:const Text('Go to counter page')),
      ),
    );
  }
}
