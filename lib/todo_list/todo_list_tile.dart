import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/models/todo.dart';

class TodoListTile extends StatefulWidget {
  const TodoListTile({Key? key, required this.todo, required this.onDelete})
      : super(key: key);

  final Todo todo;
  final Function(String) onDelete;

  @override
  _TodoListTileState createState() => _TodoListTileState();
}

class _TodoListTileState extends State<TodoListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.todo.text),
      subtitle: Text(DateFormat('yyyy-mm-dd').format(widget.todo.date)),
      leading: Checkbox(
        value: widget.todo.isDone,
        activeColor: Colors.green,
        onChanged: (value) {
          setState(() {
            widget.todo.isDone = value!;
          });
        },
      ),
      trailing: ElevatedButton(
        child: const Icon(Icons.delete),
        onPressed: () => widget.onDelete(widget.todo.id),
      ),
    );
  }
}
