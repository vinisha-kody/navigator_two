import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigator_two/routing/navigation_stack_item.dart';
import 'package:navigator_two/routing/stack.dart';

class SixthScreen extends StatelessWidget {
  const SixthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SixthScreenPage(),
    );
  }
}

class SixthScreenPage extends ConsumerStatefulWidget {
  const SixthScreenPage({super.key});

  @override
  ConsumerState<SixthScreenPage> createState() => _SixthScreenPageState();
}

class _SixthScreenPageState extends ConsumerState<SixthScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          ref.watch(navigationStackProvider).pop();
        },icon: Icon(Icons.arrow_back)),
        backgroundColor: Color(0xff152942),
        title: Text('Sixth Screen'),
      ),
      backgroundColor: Colors.grey.shade100,
      body: InkWell(
              onTap: (){
                ref.watch(navigationStackProvider).push(NavigationStackItem.SeventhScreen());
              },
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            )
    );
  }
}

