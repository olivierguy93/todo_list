import 'package:flutter/material.dart';
import 'package:todo_list/models/todo.dart';
import 'package:todo_list/todo_list/add_todo_dialogue.dart';
import 'package:todo_list/todo_list/todo_list_tile.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  var items = <TodoListTile>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return items[index];
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
            context: context,
            builder: (context) => AddTodoDialogue(onAdd: _addTodo)),
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _addTodo(Todo todo) {
    setState(() {
      items.add(TodoListTile(todo: todo, onDelete: _removeTodo));
    });
  }

  void _removeTodo(String todoId) {
    setState(() {
      var todoListTile =
          items.firstWhere((element) => element.todo.id == todoId);
      items.remove(todoListTile);
    });
  }
}
