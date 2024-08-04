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

  Food({required this.name, required this.calories});

  //code for saving the information to Json file
  Food.fromJson(Map<String, dynamic> json)
    : name = json['name'] as String,
      calories = json['calories'] as int;

  Map<String, dynamic> toJson() => {
    'name' : name,
    'calories' : calories
  };
}
