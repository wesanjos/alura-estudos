import 'package:first_application/task.dart';
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
              'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
              3),
          Task(
              'Aprender Flutter 2', 'https://dummyimage.com/72x100/000/fff', 2),
          Task(
              'Aprender Flutter 3', 'https://dummyimage.com/72x100/000/fff', 5),
          Task(
              'Aprender Flutter 4', 'https://dummyimage.com/72x100/000/fff', 1),
          Task(
              'Aprender Flutter 5', 'https://dummyimage.com/72x100/000/fff', 3),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isOpacity = !isOpacity;
          });
        },
        child: Icon(Icons.remove_red_eye),
      ),
    );
  }
}
