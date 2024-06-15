import 'package:flutter/material.dart';
import 'package:my_app_project/util/values.dart';
import 'package:my_app_project/widgets/customDrawer.dart';
import 'package:my_app_project/domain/Todo.dart';
import 'package:my_app_project/widgets/spaces.dart';
import 'package:my_app_project/widgets/custom_button.dart';
import 'package:my_app_project/widgets/custom_text_form_field.dart';
import 'package:my_app_project/widgets/todoList_listview.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<Todo> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: Sizes.ELEVATION_0,
        backgroundColor: AppColors.blue,
        title: Text("Todo List"),
      ),
      body: TodoList(
        todos: todos,
        onRemoveTodo: _removeTodo,
        onToggleTodo: _toggleTodo, // 추가: 체크박스 토글 콜백 함수
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.blue,
        onPressed: () => _addTodo(),
        child: Icon(
          Icons.add_task,
        ),
      ),
      endDrawer: CustomDrawer(),
    );
  }

  // 추가: 리스트 항목 추가 함수
  void _addTodo() async {
    final TextEditingController controller = TextEditingController();

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('할일 추가'),
          contentPadding: EdgeInsetsDirectional.all(10.0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CustomTextFormField(
                hasPrefixIcon: true,
                textInputType: TextInputType.text,
                hintText: '할일',
                hintTextStyle:
                    Styles.customTextStyle(fontWeight: FontWeight.w200),
                textStyle: Styles.customTextStyle(),
                prefixIcon: Icon(
                  Icons.add_task,
                  color: AppColors.blackShade,
                  size: Sizes.ICON_SIZE_20,
                ),
                controller: controller,
              ),
            ],
          ),
          actions: <Widget>[
            Row(children: [
              SpaceW8(),
              Expanded(
                child: CustomButton(
                  title: '추가',
                  height: 30,
                  color: AppColors.blue,
                  textStyle: TextStyle(color: AppColors.blackShade),
                  onPressed: () {
                    setState(() => todos.add(Todo(title: controller.text)));
                    Navigator.of(context).pop();
                  },
                ),
              ),
              SpaceW8(),
              Expanded(
                child: CustomButton(
                  title: '취소',
                  height: 30,
                  color: AppColors.blackShade,
                  textStyle: TextStyle(color: AppColors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              SpaceW8()
            ]),
          ],
        );
      },
    );
  }
  
  // 삭제: 리스트 항목 삭제 함수
  void _removeTodo(int index) {
    Todo temp = todos[index];
    setState(() {
      todos.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('할일 목록이 삭제 되었습니다.'),
        action: SnackBarAction(
          label: '취소하기',
          onPressed: () {
            setState(() {
              print("check...");
              todos.insert(index, Todo(title: temp.title, isDone: temp.isDone));
            });
          },
        ),
      ),
    );
  }

  // 추가: 체크박스 토글 함수
  void _toggleTodo(int index) {
    setState(() {
      todos[index].isDone = !todos[index].isDone;
    });
  }
}
