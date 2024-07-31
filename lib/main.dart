import 'package:flutter/material.dart';
import 'package:calorie_tracker/food.dart';
import 'package:calorie_tracker/workout.dart';

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
                  ...List.generate(
                    foodList.length,
                        (index) => buildAllFoodCards(index),
                  ),
                  addNewFoodCard(),
                ]
            ),
          ),
          SingleChildScrollView(
            child: Column(
                children: [
                  Text('Todo: add workout section')
                ]
            ),
          ),
        ],
      ),
    );
  }

  //todo: add card info
  Widget buildAllFoodCards(int index) {
    return Card();
  }

  //todo: add card info
  Widget addNewFoodCard() {
    return Card();
  }
}
