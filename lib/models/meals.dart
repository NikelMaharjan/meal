

class Meals {

  String
  strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6,strIngredient7,
      strIngredient8,strIngredient9, strIngredient10, strIngredient11, strIngredient12 ,strIngredient13,
      strIngredient14, strIngredient15,strIngredient16, strIngredient17;
  String instructions;
  String image;
  String name;
  String videoId;
  String idMeal;

  Meals({
    required this.idMeal,
    required this.instructions,
    required this.image,
    required this.name,
    required this.videoId,
    required this.strIngredient1,
    required this.strIngredient2,
    required this.strIngredient3,
    required this.strIngredient4,
    required this.strIngredient5,
    required this.strIngredient6,
    required this.strIngredient7,
    required this.strIngredient8,
    required this.strIngredient9,
    required this.strIngredient10,
    required this.strIngredient11,
    required this.strIngredient12,
    required this.strIngredient13,
    required this.strIngredient14,
    required this.strIngredient15,
    required this.strIngredient16,
    required this.strIngredient17,
  });

  factory Meals.fromJson(Map<String, dynamic> json){
    return Meals(
      instructions: json["strInstructions"] ?? "",
      idMeal: json["idMeal"] ?? "",
      image: json['strMealThumb'] ?? "",
      name: json['strMeal'] ?? "",
      videoId: json['strYoutube'] ?? "",
      strIngredient1: json['strIngredient1'] ?? "",
      strIngredient2: json['strIngredient2'] ?? "",
      strIngredient3: json['strIngredient3'] ?? "",
      strIngredient4: json['strIngredient4'] ?? "",
      strIngredient5: json['strIngredient5'] ?? "",
      strIngredient6: json['strIngredient6'] ?? "",
      strIngredient7: json['strIngredient7'] ?? "",
      strIngredient8: json['strIngredient8'] ?? "",
      strIngredient9: json['strIngredient9'] ?? "",
      strIngredient10: json['strIngredient10'] ?? "",
      strIngredient11: json['strIngredient11'] ?? "",
      strIngredient12: json['strIngredient12'] ?? "",
      strIngredient13: json['strIngredient13'] ?? "",
      strIngredient14: json['strIngredient14'] ?? "",
      strIngredient15: json['strIngredient15'] ?? "",
      strIngredient16: json['strIngredient16'] ?? "",
      strIngredient17: json['strIngredient17'] ?? "",
    );
  }


}