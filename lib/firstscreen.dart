import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigator_two/routing/navigation_stack_item.dart';
import 'package:navigator_two/routing/stack.dart';
import 'package:navigator_two/secondscreen.dart';


class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreenPage(),
    );
  }
}

class FirstScreenPage extends StatefulWidget {
  const FirstScreenPage({super.key});

  @override
  State<FirstScreenPage> createState() => _FirstScreenPageState();
}

class _FirstScreenPageState extends State<FirstScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff152942),
        title: Text('First Screen'),
      ),
      backgroundColor: Colors.grey.shade100,
      body: Consumer(
          builder: (context,ref,child){
            return InkWell(
              onTap: (){
                ref.watch(navigationStackProvider).push(NavigationStackItem.SecondScreen());
              },
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            );
          }
      ),
    );
  }
}

