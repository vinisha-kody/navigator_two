import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigator_two/routing/navigation_stack_item.dart';
import 'package:navigator_two/routing/stack.dart';

class SeventhScreen extends StatelessWidget {
  const SeventhScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SeventhScreenPage(),
    );
  }
}

class SeventhScreenPage extends ConsumerStatefulWidget {
  const SeventhScreenPage({super.key});

  @override
  ConsumerState<SeventhScreenPage> createState() => _SeventhScreenPageState();
}

class _SeventhScreenPageState extends ConsumerState<SeventhScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          ref.watch(navigationStackProvider).pop();
        },icon: Icon(Icons.arrow_back)),
        backgroundColor: Color(0xff152942),
        title: Text('Seventh Screen'),
      ),
      backgroundColor: Colors.grey.shade100,
      body: InkWell(
              onTap: (){
              },
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            )
    );
  }
}

