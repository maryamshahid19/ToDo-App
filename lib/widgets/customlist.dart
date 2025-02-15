import 'package:flutter/material.dart';

class CustomListItem extends StatefulWidget {
  const CustomListItem(
      {super.key,
      required this.isDone,
      required this.toDoTask,
      required this.index});

  final bool isDone;
  final String toDoTask;
  final int index;

  @override
  State<CustomListItem> createState() => _CustomListItemState();
}

class _CustomListItemState extends State<CustomListItem> {
  late bool isDone;

  @override
  void initState() {
    isDone = widget.isDone;
    super.initState();
  }

  Color getTileColor(int index) {
    List<Color> colors = [
      const Color.fromARGB(255, 71, 191, 179),
      const Color.fromARGB(255, 167, 216, 212),
      const Color.fromARGB(255, 222, 231, 125),
      Colors.lime,
      const Color.fromARGB(255, 86, 156, 143),
    ];

    return colors[index % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: ListTile(
        onTap: () {
          setState(() {
            isDone = !isDone;
          });
        },
        title: Text(
          widget.toDoTask,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        trailing: Checkbox(
          value: isDone,
          onChanged: (obj) {},
          activeColor: Colors.black,
        ),
        tileColor: getTileColor(widget.index),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
