import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var selectedChoice = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Text("Filters",
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w700)),
              SizedBox(
                height: 20.0,
              ),
              Text("Orientation"),
              Wrap(
                children: <Widget>[
                  ChoiceChip(
                    avatar: CircleAvatar(
                      backgroundColor: Colors.grey.shade800,
                      child: Text('H'),
                    ),
                    label: Text('Horizontal'),
                    elevation: 3.0,
                    selected:  selectedChoice=='Horizontal',

                  ),
                  SizedBox(width: 10.0),
                  Chip(
                    avatar: CircleAvatar(
                      backgroundColor: Colors.grey.shade800,
                      child: Text('V'),
                    ),
                    label: Text('Vertical'),
                  ),                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
