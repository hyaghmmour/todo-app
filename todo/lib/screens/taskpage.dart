import 'package:flutter/material.dart';
import 'package:todo/database_helper.dart';
import 'package:todo/models/task.dart';
import 'package:todo/widgets.dart';

class TaskPage extends StatefulWidget {
  final Task task;

  TaskPage({@required this.task});
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  String taskTitle = "";

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    if (widget.task != null) {
      taskTitle = widget.task.title; 
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 10.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Icon(Icons.arrow_back),
                      ),
                    ),
                    Expanded(
                        child: TextField(
                      onSubmitted: (value) async {
                        print("Field Value: $value");

                        if (value != "") {
                          if (widget.task == null) {
                            DatabaseHelper _dbHelper = DatabaseHelper();

                            Task _newTask = Task(title: value);
                            await _dbHelper.insertTask(_newTask);
                            print("New task has been created");
                          }
                        } else {
                          print("Task Updated");
                        }
                      },
                      controller: TextEditingController()..text = taskTitle,
                      decoration: InputDecoration(
                          hintText: "Enter Task Title",
                          border: InputBorder.none),
                      style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff211551)),
                    )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Description for your task",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 24.0)),
                ),
              ),
              TodoWidget(
                task: "Create First Task",
                isChecked: false,
              ),
              TodoWidget(
                task: "Create First Task",
                isChecked: true,
              ),
              TodoWidget(
                task: "Create First Task",
                isChecked: false,
              ),
              TodoWidget(
                task: "Create First Task",
                isChecked: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}
