import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<String> todoList = [];

  @override
  void initState() {
    super.initState();
    todoList.add('당근 사오기');
    todoList.add('약 사오기');
    todoList.add('청소하기');
    todoList.add('플러터 공부');
    todoList.add('자바스크립트 공부');
  }

  @override
  Widget build(BuildContext context) {
    void navAndGetData(conext) async {
      final result = await Navigator.of(context).pushNamed('/second');
      setState(() {
        todoList.add(result as String);
      });
    }

    return Scaffold(
        appBar: AppBar(title: const Text('FirstPage')),
        floatingActionButton: FloatingActionButton(
          elevation: 2,
          child: const Icon(Icons.add),
          onPressed: () {
            navAndGetData(context);
          },
        ),
        body: ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (context, i) {
              final todo = todoList[i];
              return Dismissible(
                key: ObjectKey(todo),
                direction: DismissDirection.startToEnd,
                onDismissed: (_) {
                  setState(() {
                    todoList.remove(todo);
                  });
                },
                child: Card(
                  child: InkWell(
                    child: Text(todo, style: const TextStyle(fontSize: 30)),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('/third', arguments: todo);
                    },
                  ),
                ),
              );
            }));
  }
}
