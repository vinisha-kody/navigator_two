import 'package:flutter/material.dart';
import 'package:navigator_two/fourthscreen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigator_two/routing/navigation_stack_item.dart';
import 'package:navigator_two/routing/stack.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ThirdScreenPage(),
    );
  }
}

class ThirdScreenPage extends ConsumerStatefulWidget {
  const ThirdScreenPage({super.key});

  @override
  ConsumerState<ThirdScreenPage> createState() => _ThirdScreenPageState();
}

class _ThirdScreenPageState extends ConsumerState<ThirdScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          ref.watch(navigationStackProvider).pop();
        },icon: Icon(Icons.arrow_back)),
        backgroundColor: Color(0xff152942),
        title: Text('Third Screen'),
      ),
      backgroundColor: Colors.grey.shade100,
      body: InkWell(
              onTap: (){
                ref.watch(navigationStackProvider).push(NavigationStackItem.FourthScreen());
              },
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            )
    );
  }
}

