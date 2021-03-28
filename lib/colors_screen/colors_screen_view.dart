import 'package:flutter/material.dart';

class ColorsScreen extends StatefulWidget {
  @override
  _ColorsScreenState createState() => _ColorsScreenState();
}

class _ColorsScreenState extends State<ColorsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coolors"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: _generateMultiplesColumn(),
        ),
      ),
    );
  }

  List<Widget> _generateMultiplesColumn() {
    List<Widget> columnsToDisplay = [];
    List<Color> columnsColors = [
      Colors.green,
      Colors.blue,
      Colors.orange,
      Colors.amber,
      Colors.cyan,
      Colors.purple
    ];

    for (var item in columnsColors) {
      columnsToDisplay.add(
        Container(
          width: MediaQuery.of(context).size.width / 5,
          color: item,
          child: Column(
            children: [Text("Column")],
          ),
        ),
      );
    }

    return columnsToDisplay;
  }
}
