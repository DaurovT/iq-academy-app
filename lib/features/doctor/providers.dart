import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/api/providers.dart';
import '../../core/models/check.dart';

final recipesProvider = FutureProvider<List<Recipe>>((ref) {
  return ref.watch(apiProvider).recipes.mine();
});

final recipeDetailProvider =
    FutureProvider.family<RecipeDetail, int>((ref, id) {
  return ref.watch(apiProvider).recipes.get(id);
});
