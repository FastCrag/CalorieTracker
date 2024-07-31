import 'package:flutter/material.dart';
import 'package:calorie_tracker/main.dart';
import 'package:calorie_tracker/food.dart';

class AddFoodPage extends StatefulWidget {
  final List foodList;

  const AddFoodPage({
    Key? key,
    required this.foodList,
  }) : super(key: key);

  @override
  State<AddFoodPage> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFoodPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _calorieController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Add a New Meal/Snack'),
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
                  controller: _nameController,
                  obscureText: false,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Add the Food Name',
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
                    labelText: 'Add a Calorie Amount',
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
    String newName = _nameController.text;
    int newCalories = int.parse(_calorieController.text);

    widget.foodList.add(Food(name: newName, calories: newCalories));

    // Pass back the updated lists
    Navigator.pop(context, true);
  }
}