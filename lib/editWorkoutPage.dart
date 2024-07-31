import 'package:flutter/material.dart';
import 'package:calorie_tracker/main.dart';
import 'package:calorie_tracker/workout.dart';

class EditWorkoutPage extends StatefulWidget {
  final List workoutList;
  final int index;

  const EditWorkoutPage({
    Key? key,
    required this.workoutList,
    required this.index,
  }) : super(key: key);

  @override
  State<EditWorkoutPage> createState() => _EditWorkoutState();
}

class _EditWorkoutState extends State<EditWorkoutPage> {
  late TextEditingController _nameController = TextEditingController(text: widget.workoutList[widget.index].getType);
  late TextEditingController _calorieController = TextEditingController(text: widget.workoutList[widget.index].getCaloriesBurned.toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Edit Meal/Snack'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Please Edit Any of the Information',
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: TextField(
                controller: _nameController,
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
                  labelText: 'How many calories did you burn?',
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),

        child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                heroTag: "1",
                backgroundColor: Colors.red,
                child: Text('Delete'),
                onPressed: () => deleteClicked(),
              ),
              Container(
                child: Row(
                    children:[
                      FloatingActionButton(
                        heroTag: "3",
                        backgroundColor: Colors.white30,
                        child: Text('Cancel'),
                        onPressed: () => cancelClicked(),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      FloatingActionButton(
                        heroTag: "2",
                        child: Text('Save'),
                        onPressed: () => saveClicked(),
                      ),
                    ]
                ),
              ),
            ]
        ),
      ),
    );
  }

  void cancelClicked() {
    Navigator.pop(context);
  }

  void deleteClicked() {
    widget.workoutList.removeAt(widget.index);
    Navigator.pop(context, true);
  }

  void saveClicked() {
    String newType = _nameController.text;
    int newCaloriesBurned = int.parse(_calorieController.text);

    widget.workoutList[widget.index].setType(newType);
    widget.workoutList[widget.index].setCaloriesBurned(newCaloriesBurned);

    // Pass back the updated lists
    Navigator.pop(context, true);
  }
}