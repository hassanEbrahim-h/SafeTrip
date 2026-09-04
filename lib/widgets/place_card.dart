import 'package:flutter/material.dart';
import '../models/place_model.dart';

class PlaceCard extends StatelessWidget {
  final PlaceModel place;
  final VoidCallback onTap;

  const PlaceCard({super.key, required this.place, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 190,
        margin: const EdgeInsets.only(right: 14),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: place.colors, begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(alignment: Alignment.topRight, child: Icon(place.icon, color: Colors.white, size: 42)),
              const Spacer(),
              Text(place.name, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Text(place.location, style: const TextStyle(color: Colors.white70, fontSize: 12)),
              const SizedBox(height: 8),
              Row(children: [
                const Icon(Icons.star_rounded, color: Colors.amber, size: 18),
                const SizedBox(width: 4),
                Text(place.rating.toString(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
