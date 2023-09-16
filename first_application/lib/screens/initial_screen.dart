import 'package:first_application/components/task.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool isOpacity = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas'),
      ),
      body: AnimatedOpacity(
        opacity: isOpacity ? 1 : 0,
        duration: const Duration(milliseconds: 1000),
        child: ListView(children: const [
          Task(
              'Aprender Flutter 1',
              'assets/images/img-demo-1.png',
              3),
          Task(
              'Aprender Flutter 2', 'assets/images/img-demo-1.png', 2),
          Task(
              'Aprender Flutter 3', 'assets/images/img-demo-2.png', 5),
          Task(
              'Aprender Flutter 4', 'assets/images/img-demo-2.png', 1),
          Task(
              'Aprender Flutter 5', 'assets/images/img-demo-2.png', 3),
          SizedBox(height: 80,)
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isOpacity = !isOpacity;
          });
        },
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}
