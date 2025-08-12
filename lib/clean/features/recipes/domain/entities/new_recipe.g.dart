// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewRecipe _$NewRecipeFromJson(Map<String, dynamic> json) => NewRecipe(
  name: json['name'] as String,
  ingredients: (json['ingredients'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  instructions: (json['instructions'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  prepTimeMinutes: (json['prepTimeMinutes'] as num).toInt(),
  cookTimeMinutes: (json['cookTimeMinutes'] as num).toInt(),
  servings: (json['servings'] as num).toInt(),
  difficulty: json['difficulty'] as String,
  cuisine: json['cuisine'] as String,
  caloriesPerServing: (json['caloriesPerServing'] as num).toInt(),
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  userId: (json['userId'] as num).toInt(),
  image: json['image'] as String,
  mealTypes: (json['mealTypes'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$NewRecipeToJson(NewRecipe instance) => <String, dynamic>{
  'name': instance.name,
  'ingredients': instance.ingredients,
  'instructions': instance.instructions,
  'prepTimeMinutes': instance.prepTimeMinutes,
  'cookTimeMinutes': instance.cookTimeMinutes,
  'servings': instance.servings,
  'difficulty': instance.difficulty,
  'cuisine': instance.cuisine,
  'caloriesPerServing': instance.caloriesPerServing,
  'tags': instance.tags,
  'userId': instance.userId,
  'image': instance.image,
  'mealTypes': instance.mealTypes,
};
