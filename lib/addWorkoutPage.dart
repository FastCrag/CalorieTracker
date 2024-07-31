import 'package:flutter/material.dart';
import 'package:calorie_tracker/main.dart';
import 'package:calorie_tracker/workout.dart';

class AddWorkoutPage extends StatefulWidget {
  final List workoutList;

  const AddWorkoutPage({
    Key? key,
    required this.workoutList,
  }) : super(key: key);

  @override
  State<AddWorkoutPage> createState() => _AddWorkoutState();
}

class _AddWorkoutState extends State<AddWorkoutPage> {
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _calorieController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Add a New Workout'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Please Fill Out All the Information',
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextField(
                  controller: _typeController,
                  obscureText: false,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Add the Workout Type (ex. Run, Lift, Hike)',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextField(
                  controller: _calorieController,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'How many Calories did you burn?',
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: "1",
                child: Text('Save'),
                onPressed: () => saveClicked(),
              ),
              SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                heroTag: "2",
                child: Text('Cancel'),
                onPressed: () => cancelClicked(),
              )
            ]
        )
    );
  }

  void cancelClicked() {
    Navigator.pop(context);
  }

  void saveClicked() {
    String newType = _typeController.text;
    int newCalories = int.parse(_calorieController.text);

    widget.workoutList.add(Workout(type: newType, caloriesBurned: newCalories));

    // Pass back the updated lists
    Navigator.pop(context, true);
  }
}