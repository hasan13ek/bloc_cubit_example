import 'package:bloc_cubit_example/ui/page_one.dart';
import 'package:bloc_cubit_example/ui/page_two.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("home PAge"),
      ),
      body: Center(child:
        Column(
          children: [
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (builder)=>PageOne()));
            }, child:const Text("Page 1")),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (builder)=>PageTwo()));

            }, child:const Text("Page 2")),
          ],
        ),),
    );
  }
}
