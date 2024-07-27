import 'package:flutter/material.dart'; // Importing the material package from Flutter

class Category {
  // Defining a class called Category
  const Category(
      {required this.id,
      required this.title,
      required this.color}); // Defining a constructor for the Category class

  final String id; // Declaring a final variable called id of type String
  final String title; // Declaring a final variable called title of type String
  final Color color; // Declaring a final variable called color of type Color
}
