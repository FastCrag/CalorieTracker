import 'package:flutter/material.dart';
import 'package:calorie_tracker/food.dart';
import 'package:calorie_tracker/workout.dart';
import 'package:calorie_tracker/addFoodPage.dart';
import 'package:calorie_tracker/addWorkoutPage.dart';
import 'package:calorie_tracker/editFoodPage.dart';
import 'package:calorie_tracker/editWorkoutPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calorie Tracker',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(title: 'Calorie Tracker'),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late final TabController _tabController;
  List<Food> foodList = [];
  List<Workout> workoutList = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.fastfood),
              text: ("Food"),
            ),
            Tab(
              icon: Icon(Icons.directions_run),
              text: ("Workouts"),
            ),
          ],
        ),
      ),

      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
                children: [
                  //Displays total amount of calories consumed
                  totalCaloriesCard(),
                  ...List.generate(
                    foodList.length,
                        (index) => createFoodCard(index),
                  ),
                  addNewFoodCard(),
                  // addCalorieTotalCard(),
                ]
            ),
          ),
          SingleChildScrollView(
            child: Column(
                children: [
                  //Displays total amount of calories consumed
                  totalCaloriesCard(),
                  ...List.generate(
                    workoutList.length,
                        (index) => createWorkoutCard(index),
                  ),
                  addNewWorkoutCard(),
                ]
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "0",
        onPressed: (){
          if (_tabController.index == 0){_addFood();}
          else {_addWorkout();}
        },
        tooltip: (_tabController.index == 0 ? "Add New Food":"Add New Workout"),
        child: const Icon(Icons.add_circle_outline),
      ),
    );
  }

  void _addFood() async {
    // Use the Future returned by Navigator.push
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddFoodPage(
          foodList: foodList,
        ),
      ),
    );
    if (result != null) {
      setState(() {
        build;
      });
    }
  }

  void _addWorkout() async {
    // Use the Future returned by Navigator.push
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddWorkoutPage(
          workoutList: workoutList,
        ),
      ),
    );
    if (result != null) {
      setState(() {
        build;
      });
    }
  }

  void _editFood(index) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditFoodPage(
          foodList: foodList,
          index: index,
        ),
      ),
    );
    if (result != null) {
      setState(() {
        build;
      });
    }
  }

  void _editWorkout(index) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditWorkoutPage(
          workoutList: workoutList,
          index: index,
        ),
      ),
    );
    if (result != null) {
      setState(() {
        build;
      });
    }
  }

  //todo: add card info
  Widget createFoodCard(int index) {
    return Card(
      elevation: 5,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.deepPurpleAccent,
        onTap: () {
          _editFood(index);
        },
        child: SizedBox(
          width: 350,
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Container(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                  mainAxisSize: MainAxisSize.min, // Set mainAxisSize to min
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            foodList[index].getName.toUpperCase(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),

                        ]
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Calories: ' + foodList[index].getCalories.toString(),
                        ),
                      ],
                    ),
                  ], //children
              ),
            ),
          )
        )

      ),
    );
  }

  Widget createWorkoutCard(int index) {
    return Card(
      elevation: 5,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.deepPurpleAccent,
        onTap: () {
          _editWorkout(index);
        },
        child: SizedBox(
          width: 350,
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Container(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                  mainAxisSize: MainAxisSize.min, // Set mainAxisSize to min
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            workoutList[index].getType.toUpperCase(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),

                        ]
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Calories: ' + workoutList[index].getCaloriesBurned.toString(),
                        ),
                      ],
                    ),
                  ], //children
              ),
            ),
          )
        )

      ),
    );
  }

  Widget addNewFoodCard() {
    return Card(
      elevation: 5,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.deepPurpleAccent,
        onTap: () {
          _addFood();
        },
        child: SizedBox(
          width: 350,
          height: 75,
          child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                    children: <Widget>[
                      Icon(Icons.add_circle_outline),
                      Center(child: Text(' Add a New Food ')),
                    ]
                ),
              )
          ),
        ),
      ),
    );
  }


  //Display total amount of calories consumed at the top of the calories list
  Widget totalCaloriesCard() {
    return Card(
      elevation: 5,
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        width: 350,
        height: 75,
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Calories: ${getTotalCalories()}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Function to get the total amount of calories
  //Also accounts for amount of calories burned from workouts
  int getTotalCalories() {
    int totalCaloriesFromFood = foodList.fold(0, (sum, food) => sum + food.getCalories);
    int totalCaloriesBurned = workoutList.fold(0, (sum, workout) => sum + workout.getCaloriesBurned);
    return totalCaloriesFromFood - totalCaloriesBurned;
  }

  Widget addNewWorkoutCard() {
    return Card(
      elevation: 5,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.deepPurpleAccent,
        onTap: () {
          _addWorkout();
        },
        child: SizedBox(
          width: 350,
          height: 75,
          child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                    children: <Widget>[
                      Icon(Icons.add_circle_outline),
                      Center(child: Text(' Add a New Workout ')),
                    ]
                ),
              )
          ),
        ),
      ),
    );
  }
}
