import 'package:flutter/material.dart';
import 'package:todo_list/models/todo.dart';

class AddTodoDialogue extends StatefulWidget {
  const AddTodoDialogue({Key? key, required this.onAdd}) : super(key: key);

  final Function(Todo) onAdd;

  @override
  _AddTodoDialogueState createState() => _AddTodoDialogueState();
}

class _AddTodoDialogueState extends State<AddTodoDialogue> {
  final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Todo'),
      content: Form(
        child: TextFormField(
          controller: _textController,
          decoration:
              InputDecoration(labelText: 'Todo', errorText: _validate()),
          onChanged: (value) => setState(() {}),
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: const Text('Add'),
          onPressed: _textController.value.text.isNotEmpty ? _submit : null,
        ),
      ],
    );
  }

  String? _validate() {
    final String? text = _textController.value.text;
    if (text == null || text.isEmpty) {
      return 'Please enter a todo';
    }

    return null;
  }

  void _submit() {
    if (_validate() == null) {
      widget.onAdd(Todo(_textController.text.trim()));
      Navigator.of(context).pop();
    }
  }
}
