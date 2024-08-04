class Food{
  String name = '';
  String get getName{
    return name;
  }
  void setName(String newName){
    name = newName;
  }

  int calories = 0;
  int get getCalories => calories;

  void setCalories(int newCalories){
    calories = newCalories;
  }

  int carbs = 0;
  int get getCarbs => carbs;

  void setCarbs(int newCarbs){
    carbs = newCarbs;
  }

  int protein = 0;
  int get getProtein => protein;

  void setProtein(int newProtein){
    protein = newProtein;
  }

  Food({required this.name, required this.calories, required this.carbs, required this.protein});

  //code for saving the information to Json file
  Food.fromJson(Map<String, dynamic> json)
    : name = json['name'] as String,
      calories = json['calories'] as int,
      carbs = json['carbs'] as int,
      protein = json['protein'] as int;


  Map<String, dynamic> toJson() => {
    'name' : name,
    'calories' : calories,
    'carbs' : carbs,
    'protein' : protein,
  };
}
