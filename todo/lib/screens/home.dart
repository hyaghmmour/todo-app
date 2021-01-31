import 'package:flutter/material.dart';
import 'package:todo/database_helper.dart';
import 'package:todo/screens/taskpage.dart';

import '../widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DatabaseHelper _dbHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          color: Color(0xffF6F6F6),
          child: Stack(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(bottom: 20.0),
                    child: Image(image: AssetImage('assets/images/logo.png'))),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: NoGlowBehavior(),
                    child: FutureBuilder(
                      initialData: [],
                      future: _dbHelper.getTasks(),
                      builder: (context, snapshot) {
                        return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TaskPage(
                                            task: snapshot.data[index])));
                              },
                              child: TaskCard(
                                title: snapshot.data[index].title,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 24.0,
              right: 0.0,
              child: GestureDetector(
                onTap: () => {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TaskPage(task: null)))
                      .then((value) => setState(() {}))
                },
                child: Container(
                  width: 60.0,
                  height: 60.0,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xff7349FE),
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
