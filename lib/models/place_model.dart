import 'package:flutter/material.dart';

class PlaceModel {
  final String name;
  final String location;
  final String description;
  final double rating;
  final IconData icon;
  final List<Color> colors;

  const PlaceModel({
    required this.name,
    required this.location,
    required this.description,
    required this.rating,
    required this.icon,
    required this.colors,
  });
}
