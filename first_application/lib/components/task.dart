import 'package:first_application/components/difficulty.dart';
import 'package:flutter/material.dart';

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
            Stack(
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
                            Difficulty(
                              difficultyLevel: widget.difficulty,
                            )
                          ],
                        ),
                        SizedBox(
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
                        child: SizedBox(
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
          ],
        ));
  }
}

