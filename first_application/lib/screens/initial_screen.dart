import 'package:first_application/components/task.dart';
import 'package:first_application/data/task_dao.dart';
import 'package:first_application/data/task_inherited.dart';
import 'package:first_application/screens/form_screen.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas'),
        actions: [
          IconButton(onPressed: () { setState((){});}, icon: const Icon(Icons.refresh))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 5, left: 16, right: 16, bottom: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Nível global',
                    ),
                    TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          EdgeInsets.zero,
                        ),
                      ),
                      onPressed: () {},
                      child: const Column(
                        children: [
                          Icon(
                            Icons.refresh,
                            size: 18,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const LinearProgressIndicator(
                  value: 1 / 10,
                  color: Colors.blueAccent,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 70,
              ),
              child: FutureBuilder<List<Task>>(
                  future: TaskDao().findAll(),
                  builder: (context, snapshot) {
                    List<Task>? items = snapshot.data;

                    //Verifica se os dados do snapshots está pronto
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return const Center(
                          child: Column(
                            children: [
                              CircularProgressIndicator(),
                              Text('Carregando...')
                            ],
                          ),
                        );
                      case ConnectionState.waiting:
                        return const Center(
                          child: Column(
                            children: [
                              CircularProgressIndicator(),
                              Text('Carregando...')
                            ],
                          ),
                        );
                      case ConnectionState.active:
                        return const Center(
                          child: Column(
                            children: [
                              CircularProgressIndicator(),
                              Text('Carregando...')
                            ],
                          ),
                        );
                      case ConnectionState.done:
                        //Verificando se possui dados e é diferente de nulo
                        if (snapshot.hasData && items != null) {
                          if (items.isNotEmpty) {
                            return ListView.builder(
                                itemCount: items.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final Task tarefa = items[index];

                                  return tarefa;
                                });
                          }

                          return const Center(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.error_outline,
                                  size: 64,
                                ),
                                Text(
                                  'Não há nenhuma tarefa!',
                                  style: TextStyle(fontSize: 22),
                                ),
                              ],
                            ),
                          );
                        }

                        return const Text('Erro ao carregar Tarefas.');
                    }

                    return const Text('Erro desconhecido!');
                  }),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(taskContext: context),
            ),
          ).then((value) => setState(() {
                print('Reload');
              }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
