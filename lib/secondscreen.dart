import 'package:flutter/material.dart';
import 'package:navigator_two/thirdscreen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigator_two/routing/navigation_stack_item.dart';
import 'package:navigator_two/routing/stack.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SecondScreenPage(),
    );
  }
}

class SecondScreenPage extends ConsumerStatefulWidget {
  const SecondScreenPage({super.key});

  @override
  ConsumerState<SecondScreenPage> createState() => _SecondScreenPageState();
}

class _SecondScreenPageState extends ConsumerState<SecondScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          ref.watch(navigationStackProvider).pop();
        }, icon: Icon(Icons.arrow_back)),
        backgroundColor: Color(0xff152942),
        title: Text('Second Screen'),
      ),
      backgroundColor: Colors.grey.shade100,
      body: InkWell(
              onTap: (){
                ref.watch(navigationStackProvider).push(NavigationStackItem.ThirdScreen());
              },
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            )
    );
  }
}

