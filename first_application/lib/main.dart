// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isOpacity = true;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
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
              Task('Aprender Flutter 2',
                  'https://dummyimage.com/72x100/000/fff', 2),
              Task('Aprender Flutter 3',
                  'https://dummyimage.com/72x100/000/fff', 5),
              Task('Aprender Flutter 4',
                  'https://dummyimage.com/72x100/000/fff', 1),
              Task('Aprender Flutter 5',
                  'https://dummyimage.com/72x100/000/fff', 3),
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
        ));
  }
}

class Task extends StatefulWidget {
  final String name;
  final String photo;
  final int difficulty;

  const Task(this.name, this.photo, this.difficulty, {super.key});

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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.blue,
                    ),
                    height: 140,
                  ),
                  Column(children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                      ),
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.black26,
                            ),
                            width: 72,
                            height: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.network(
                                widget.photo,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 200,
                                child: Text(
                                  widget.name,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 15,
                                    color: (widget.difficulty) >= 1
                                        ? Colors.blue
                                        : Colors.blue[100],
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 15,
                                    color: (widget.difficulty) >= 2
                                        ? Colors.blue
                                        : Colors.blue[100],
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 15,
                                    color: (widget.difficulty) >= 3
                                        ? Colors.blue
                                        : Colors.blue[100],
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 15,
                                    color: (widget.difficulty) >= 4
                                        ? Colors.blue
                                        : Colors.blue[100],
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 15,
                                    color: (widget.difficulty) >= 5
                                        ? Colors.blue
                                        : Colors.blue[100],
                                  ),
                                ],
                              )
                            ],
                          ),
                          Container(
                            width: 52,
                            height: 52,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    padding: const EdgeInsets.all(0),
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
                                    Icon(
                                      Icons.arrow_drop_up_outlined,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      'UP',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white),
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
                              value: (widget.difficulty > 0)
                                  ? (nivel / widget.difficulty) / 10
                                  : 1,
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
