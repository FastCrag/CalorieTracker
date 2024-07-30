class Food{
  String name = '';
  String get getName{
    return name;
  }
  void setName(String newName){
    name = newName;
  }

  int calories = 0;
  int get getCalories{
    return calories;
  }
  void setCaloriesLOL(int newCalories){
    calories = newCalories;
  }

  Food({required this.name, required this.calories});
}
