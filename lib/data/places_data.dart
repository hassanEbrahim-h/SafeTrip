import 'package:flutter/material.dart';
import '../models/place_model.dart';

const placesData = [
  PlaceModel(
    name: 'Sharm El Sheikh',
    location: 'South Sinai, Egypt',
    description: 'Beautiful beaches, clear water and unforgettable adventures.',
    rating: 4.9,
    icon: Icons.waves_rounded,
    colors: [Color(0xFF0EA5E9), Color(0xFF0369A1)],
  ),
  PlaceModel(
    name: 'Cairo',
    location: 'Cairo, Egypt',
    description: 'Discover history, culture and the greatness of ancient Egypt.',
    rating: 4.8,
    icon: Icons.account_balance_rounded,
    colors: [Color(0xFFF59E0B), Color(0xFFD97706)],
  ),
  PlaceModel(
    name: 'Luxor',
    location: 'Luxor, Egypt',
    description: 'A journey through temples, kings and Egyptian civilization.',
    rating: 4.7,
    icon: Icons.temple_buddhist_rounded,
    colors: [Color(0xFF8B5CF6), Color(0xFF6D28D9)],
  ),
  PlaceModel(
    name: 'Alexandria',
    location: 'Alexandria, Egypt',
    description: 'Mediterranean views, history and a relaxing city atmosphere.',
    rating: 4.6,
    icon: Icons.location_city_rounded,
    colors: [Color(0xFF14B8A6), Color(0xFF0F766E)],
  ),
];
