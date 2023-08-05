import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Tarefas'),
          ),
          body: ListView(children: const [
            Task('Aprender Flutter 1', 'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large'),
            Task('Aprender Flutter 2', 'https://dummyimage.com/72x100/000/fff'),
            Task('Aprender Flutter 3', 'https://dummyimage.com/72x100/000/fff'),
            Task('Aprender Flutter 4', 'https://dummyimage.com/72x100/000/fff'),
            Task('Aprender Flutter 5', 'https://dummyimage.com/72x100/000/fff'),
          ]),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
          ),
        ));
  }
}

class Task extends StatefulWidget {
  final String name;
  final String photo;
  const Task(this.name, this.photo, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    color: Colors.blue,
                    height: 140,
                  ),
                  Column(children: [
                    Container(
                      color: Colors.white,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            color: Colors.black26,
                            width: 72,
                            height: 100,
                            child: Image.network(
                              widget.photo,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 200,
                            child: Text(
                              widget.name,
                              style: const TextStyle(
                                  fontSize: 20,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                          Container(
                            width: 52,
                            height: 52,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(0),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero)),
                                onPressed: () {
                                  setState(() {
                                    nivel++;
                                  });
                                },
                                child: const Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.arrow_drop_up_outlined),
                                    Text(
                                      'UP',
                                      style: TextStyle(fontSize: 12),
                                    )
                                  ],
                                )),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 200,
                            child: LinearProgressIndicator(
                              color: Colors.black26,
                              value: nivel / 10,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Nível $nivel',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ])
                ],
              ),
            ),
          ],
        ));
  }
}
