import 'package:json_annotation/json_annotation.dart';

part 'new_recipe.g.dart';

@JsonSerializable()
class NewRecipe {
  final String name;
  final List<String> ingredients;
  final List<String> instructions;
  final int prepTimeMinutes;
  final int cookTimeMinutes;
  final int servings;
  final String difficulty;
  final String cuisine;
  final int caloriesPerServing;
  final List<String> tags;
  final int userId;
  final String image;
  final List<String>? mealTypes;

  NewRecipe({
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.servings,
    required this.difficulty,
    required this.cuisine,
    required this.caloriesPerServing,
    required this.tags,
    required this.userId,
    required this.image,
    required this.mealTypes,
  });

  factory NewRecipe.fromJson(Map<String, dynamic> json) =>
      _$NewRecipeFromJson(json);

  Map<String, dynamic> toJson() => _$NewRecipeToJson(this);
}
