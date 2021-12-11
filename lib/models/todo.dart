import 'package:uuid/uuid.dart';

class Todo {
  String text = "";
  bool isDone = false;
  DateTime date = DateTime.now();
  final String id = const Uuid().v4();

  Todo(this.text);
}
