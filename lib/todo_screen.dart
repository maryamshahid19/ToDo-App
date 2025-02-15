import 'package:flutter/material.dart';
import 'package:responsive_ui_task/widgets/customlist.dart';

class ToDoHomePage extends StatelessWidget {
  ToDoHomePage({super.key});

  final List<String> toDoTasks = [
    "Task 1",
    "Task 2",
    "Task 3",
    "Task 4",
    "Task 5",
    "Task 6",
    "Task 7",
    "Task 8",
    "Task 9",
    "Task 10",
    "Task 11",
    "Task 12",
    "Task 13",
    "Task 14",
    "Task 15",
    "Task 16",
    "Task 17",
    "Task 18",
    "Task 19",
    "Task 20"
  ];

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    int halfLength = toDoTasks.length ~/ 2;

    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List App'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: isPortrait
                ? ListView.builder(
                    itemCount: toDoTasks.length,
                    itemBuilder: (context, index) {
                      return CustomListItem(
                          isDone: false,
                          toDoTask: toDoTasks[index],
                          index: index);
                    })
                : Row(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: halfLength,
                            itemBuilder: (context, index) {
                              return CustomListItem(
                                  isDone: false,
                                  toDoTask: toDoTasks[index],
                                  index: index);
                            }),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ListView.builder(
                            itemCount: halfLength,
                            itemBuilder: (context, index) {
                              return CustomListItem(
                                isDone: false,
                                toDoTask: toDoTasks[index + halfLength],
                                index: index,
                              );
                            }),
                      ),
                    ],
                  )),
      ),
    );
  }
}
