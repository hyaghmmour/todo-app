import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title, description;

  TaskCard({this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            this.title ?? "No title here",
            style: TextStyle(
                color: Color(0xff211551),
                fontSize: 22.0,
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              this.description ?? "No Description",
              style: TextStyle(color: Color(0xff86829D)),
            ),
          )
        ],
      ),
    );
  }
}

class TodoWidget extends StatelessWidget {
  final String task;
  bool isChecked;

  TodoWidget({this.task, @required this.isChecked});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("object");
        this.isChecked = !this.isChecked;
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
            child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 10.0),
              child: Container(
                width: 20,
                height: 20,
                child: this.isChecked
                    ? Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 10,
                      )
                    : null,
                decoration: BoxDecoration(
                    color:
                        this.isChecked ? Color(0xff7349FE) : Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    border: isChecked
                        ? null
                        : Border.all(color: Color(0xff7349fe))),
              ),
            ),
            Text(
              this.task ?? "Unamed",
              style: this.isChecked
                  ? TextStyle(
                      color: Color(0xff211551),
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold)
                  : TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
            )
          ],
        )),
      ),
    );
  }
}

class NoGlowBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext buildContext, Widget child, AxisDirection axisDirection) {
    return child; 
  }
}
