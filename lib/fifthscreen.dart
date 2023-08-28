import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigator_two/routing/navigation_stack_item.dart';
import 'package:navigator_two/routing/stack.dart';

class FifthScreen extends StatelessWidget {
  const FifthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FifthScreenPage(),
    );
  }
}

class FifthScreenPage extends ConsumerStatefulWidget {
  const FifthScreenPage({super.key});

  @override
  ConsumerState<FifthScreenPage> createState() => _FifthScreenPageState();
}

class _FifthScreenPageState extends ConsumerState<FifthScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          ref.watch(navigationStackProvider).pop();
        },icon: Icon(Icons.arrow_back)),
        backgroundColor: Color(0xff152942),
        title: Text('Fifth Screen'),
      ),
      backgroundColor: Colors.grey.shade100,
      body: InkWell(
              onTap: (){
                ref.watch(navigationStackProvider).push(NavigationStackItem.SixthScreen());
              },
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            )
    );
  }
}

