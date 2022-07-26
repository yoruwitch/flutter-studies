import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  TextEditingController _textEditingController = TextEditingController();

  List<String> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(children: [
          TextField(
            controller: _textEditingController,
          ),
          Container(
            height: 300,
            child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(tasks[index]),
                    onLongPress: () {
                      setState(() {
                        tasks.removeAt(index);
                      });
                    },
                  );
                }),
          ),
        ]),
      ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.purpleAccent,
            onPressed: () {
              if (_textEditingController.text.length > 0) {
                setState(() {
                  tasks.add(_textEditingController.text);
                });
                _textEditingController.clear();
              }
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            backgroundColor: Colors.purpleAccent,
            onPressed: () {
              setState(() {
                tasks = [];
              });
              _textEditingController.clear();
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
