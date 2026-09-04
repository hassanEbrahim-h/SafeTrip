import 'package:flutter/material.dart';
import '../../models/place_model.dart';
import '../../core/constants/app_colors.dart';
import '../trips/trip_planner_screen.dart';

class PlaceDetailsScreen extends StatelessWidget {
  final PlaceModel place;
  const PlaceDetailsScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(gradient: LinearGradient(colors: place.colors, begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start, children: [
                  CircleAvatar(backgroundColor: Colors.white, child: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context))),
                  const CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.favorite, color: Colors.red)),
                ]),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(22),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(place.name, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text('📍 ${place.location}   ⭐ ${place.rating}', style: const TextStyle(color: AppColors.textGrey)),
                const SizedBox(height: 25),
                const Text('About', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(place.description, style: const TextStyle(color: AppColors.textGrey, height: 1.6)),
                const SizedBox(height: 25),
                const Text('Facilities', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 15),
                const Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                  _Facility(Icons.hotel_rounded, 'Hotels'),
                  _Facility(Icons.restaurant_rounded, 'Restaurants'),
                  _Facility(Icons.directions_car_rounded, 'Transport'),
                  _Facility(Icons.local_activity_rounded, 'Activities'),
                ]),
                const SizedBox(height: 30),
                SizedBox(width: double.infinity, height: 54, child: ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => TripPlannerScreen(destination: place.name))), child: const Text('Plan This Trip'))),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _Facility extends StatelessWidget {
  final IconData icon; final String text;
  const _Facility(this.icon, this.text);
  @override
  Widget build(BuildContext context) => Column(children: [
    CircleAvatar(radius: 25, backgroundColor: AppColors.primary.withOpacity(.1), child: Icon(icon, color: AppColors.primary)),
    const SizedBox(height: 6), Text(text, style: const TextStyle(fontSize: 11)),
  ]);
}
