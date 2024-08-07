class Workout{
  String type = '';
  String get getType{
    return type;
  }
  void setType(String newType){
    type = newType;
  }

  int caloriesBurned = 0;
  int get getCaloriesBurned{
    return caloriesBurned;
  }
  void setCaloriesBurned(int newCalories){
    caloriesBurned = newCalories;
  }

  Workout({required this.type, required this.caloriesBurned});

  Workout.fromJson(Map<String, dynamic> json)
      : type = json['type'] as String,
        caloriesBurned = json['caloriesBurned'] as int;

  Map<String, dynamic> toJson() => {
    'type' : type,
    'caloriesBurned' : caloriesBurned
  };
}