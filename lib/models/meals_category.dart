

class MealsCategory {


  final String id;
  final String name;
  final String image;
  final String description;


  MealsCategory({required this.id, required this.name, required this.image, required this.description});

  factory MealsCategory.fromJson (Map<String, dynamic> json){
    return MealsCategory(
        id: json['idCategory'] ?? json["idMeal"],
        name: json['strCategory'] ?? json['strMeal'],
        image: json['strCategoryThumb'] ?? json['strMealThumb'],
        description: json['strCategoryDescription'] ?? ""
    );
  }



}
