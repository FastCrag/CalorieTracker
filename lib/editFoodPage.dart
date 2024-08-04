import 'package:flutter/material.dart';
import 'package:calorie_tracker/main.dart';
import 'package:calorie_tracker/food.dart';

class EditFoodPage extends StatefulWidget {
  final List foodList;
  final int index;

  const EditFoodPage({
    Key? key,
    required this.foodList,
    required this.index,
  }) : super(key: key);

  @override
  State<EditFoodPage> createState() => _EditFoodState();
}

class _EditFoodState extends State<EditFoodPage> {
  late TextEditingController _nameController = TextEditingController(text: widget.foodList[widget.index].getName);
  late TextEditingController _calorieController = TextEditingController(text: widget.foodList[widget.index].getCalories.toString());
  late TextEditingController _carbsController = TextEditingController(text: widget.foodList[widget.index].getCarbs.toString());
  late TextEditingController _proteinController = TextEditingController(text: widget.foodList[widget.index].getProtein.toString());

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
              Container(
                margin: const EdgeInsets.all(20),
                child: TextField(
                  controller: _carbsController,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Add a Carb Amount (g)',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextField(
                  controller: _proteinController,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Add a Protein Amount (g)',
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
    widget.foodList.removeAt(widget.index);
    Navigator.pop(context, true);
  }

  void saveClicked() {
    String newName = _nameController.text;
    int newCalories = int.parse(_calorieController.text);
    int newCarbs = int.parse(_carbsController.text);
    int newProtein = int.parse(_proteinController.text);

    widget.foodList[widget.index].setName(newName);
    widget.foodList[widget.index].setCalories(newCalories);
    widget.foodList[widget.index].setCarbs(newCarbs);
    widget.foodList[widget.index].setProtein(newProtein);

    // Pass back the updated lists
    Navigator.pop(context, true);
  }
}