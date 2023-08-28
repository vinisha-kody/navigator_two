import 'package:flutter/material.dart';
import 'package:navigator_two/fifthscreen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigator_two/routing/navigation_stack_item.dart';
import 'package:navigator_two/routing/stack.dart';

class FourthScreen extends StatelessWidget {
  const FourthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FourthScreenPage(),
    );
  }
}

class FourthScreenPage extends ConsumerStatefulWidget {
  const FourthScreenPage({super.key});

  @override
  ConsumerState<FourthScreenPage> createState() => _FourthScreenPageState();
}

class _FourthScreenPageState extends ConsumerState<FourthScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          ref.watch(navigationStackProvider).pop();
        },icon: Icon(Icons.arrow_back)),
        backgroundColor: Color(0xff152942),
        title: Text('Fourth Screen'),
      ),
      backgroundColor: Colors.grey.shade100,
      body: InkWell(
              onTap: (){
                ref.watch(navigationStackProvider).push(NavigationStackItem.FifthScreen());
              },
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            )
    );
  }
}

