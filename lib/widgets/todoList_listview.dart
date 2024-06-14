import 'package:flutter/material.dart';
import 'package:my_app_project/domain/Todo.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  final Function(int index) onRemoveTodo;
  final Function(int index) onToggleTodo; // 추가: 체크박스 토글 함수

  TodoList({
    required this.todos,
    required this.onRemoveTodo,
    required this.onToggleTodo,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(todos[index].title),
          onDismissed: (direction) => onRemoveTodo(index),
          background: Container(
            color: Colors.red,
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 20.0),
          ),
          child: ListTile(
            title: Text(todos[index].title,
                style: todos[index].isDone
                    ? TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.black12)
                    : TextStyle(decoration: TextDecoration.none)),
            leading: Checkbox(
              value: todos[index].isDone,
              onChanged: (bool? value) {
                onToggleTodo(index); // 추가: 체크박스 토글 함수 호출
              },
            ),
          ),
        );
      },
    );
  }
}
