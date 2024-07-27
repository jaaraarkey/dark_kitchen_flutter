enum Complexity {
  // Enum for the complexity of a meal
  simple, // Simple complexity
  challenging, // Challenging complexity
  hard, // Hard complexity
}

enum Affordability {
  // Enum for the affordability of a meal
  affordable, // Affordable
  pricey, // Pricey
  luxurious, // Luxurious
}

class Meal {
  // Class representing a meal
  const Meal({
    // Constructor for the Meal class
    required this.id, // Unique identifier for the meal
    required this.categories, // List of categories the meal belongs to
    required this.title, // Title of the meal
    required this.imageUrl, // URL of the meal's image
    required this.ingredients, // List of ingredients for the meal
    required this.steps, // List of steps to prepare the meal
    required this.duration, // Duration to prepare the meal
    required this.complexity, // Complexity of the meal
    required this.affordability, // Affordability of the meal
    required this.isGlutenFree, // Indicates if the meal is gluten-free
    required this.isLactoseFree, // Indicates if the meal is lactose-free
    required this.isVegan, // Indicates if the meal is vegan
    required this.isVegetarian, // Indicates if the meal is vegetarian
  });

  final String id; // Unique identifier for the meal
  final List<String> categories; // List of categories the meal belongs to
  final String title; // Title of the meal
  final String imageUrl; // URL of the meal's image
  final List<String> ingredients; // List of ingredients for the meal
  final List<String> steps; // List of steps to prepare the meal
  final int duration; // Duration to prepare the meal
  final Complexity complexity; // Complexity of the meal
  final Affordability affordability; // Affordability of the meal
  final bool isGlutenFree; // Indicates if the meal is gluten-free
  final bool isLactoseFree; // Indicates if the meal is lactose-free
  final bool isVegan; // Indicates if the meal is vegan
  final bool isVegetarian; // Indicates if the meal is vegetarian
}
