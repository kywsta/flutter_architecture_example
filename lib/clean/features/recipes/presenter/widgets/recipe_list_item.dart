import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_example/clean/features/recipes/domain/entities/recipe.dart';

class RecipeListItem extends StatelessWidget {
  final Recipe recipe;

  const RecipeListItem({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.hardEdge,
      color: theme.colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImage(theme),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 8),
            child: _buildHightlightChips(theme),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: _buildNameAndRate(theme),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 12),
            child: _buildIngredients(theme),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(ThemeData theme) {
    return AspectRatio(
      aspectRatio: 4 / 3,
      child: Stack(
        children: [
          Positioned.fill(
            child: CachedNetworkImage(
              imageUrl: recipe.image,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 32,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,

                  colors: [
                    theme.colorScheme.surface.withAlpha(255),
                    theme.colorScheme.surface.withAlpha(100),
                    theme.colorScheme.surface.withAlpha(0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHightlightChips(ThemeData theme) {
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: [
        if (recipe.isHealthy)
          Chip(
            avatar: const Icon(Icons.health_and_safety),
            label: Text('Low Calories'),
            visualDensity: VisualDensity.compact,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            // backgroundColor: Colors.green.withAlpha(100),
            shape: StadiumBorder(),
            labelStyle: theme.textTheme.bodyMedium!.copyWith(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: IconThemeData(color: Colors.green),
          ),
        if (recipe.isQuick)
          Chip(
            avatar: const Icon(Icons.timer),
            label: Text('Quick'),
            visualDensity: VisualDensity.compact,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            // backgroundColor: Colors.green.withAlpha(100),
            shape: StadiumBorder(),
            labelStyle: theme.textTheme.bodyMedium!.copyWith(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: IconThemeData(color: Colors.amber),
          ),
      ],
    );
  }

  Widget _buildNameAndRate(ThemeData theme) {
    return Row(
      children: [
        Expanded(child: Text(recipe.name, style: theme.textTheme.titleLarge)),
        Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.star, color: Colors.orange),
            Text(
              recipe.rating.toString(),
              style: theme.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildIngredients(ThemeData theme) {
    return RichText(
      text: TextSpan(
        style: theme.textTheme.bodyMedium,
        children: [
          TextSpan(
            text: "Ingredients: ",
            style: theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(text: recipe.ingredients.join(", ")),
        ],
      ),
    );
  }
}
