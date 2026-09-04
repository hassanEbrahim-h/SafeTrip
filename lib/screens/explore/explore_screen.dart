import 'package:flutter/material.dart';
import '../../data/places_data.dart';
import '../../widgets/place_card.dart';
import '../details/place_details_screen.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Explore Egypt', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 18),
            const TextField(decoration: InputDecoration(hintText: 'Search places...', prefixIcon: Icon(Icons.search))),
            const SizedBox(height: 15),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                Chip(label: Text('All')),
                SizedBox(width: 8), Chip(label: Text('Beach')),
                SizedBox(width: 8), Chip(label: Text('Historical')),
                SizedBox(width: 8), Chip(label: Text('Nature')),
              ]),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                itemCount: placesData.length,
                separatorBuilder: (_, __) => const SizedBox(height: 14),
                itemBuilder: (context, i) {
                  final p = placesData[i];
                  return InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PlaceDetailsScreen(place: p))),
                    borderRadius: BorderRadius.circular(18),
                    child: Container(
                      height: 105,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
                      child: Row(children: [
                        Container(width: 78, height: 78, decoration: BoxDecoration(gradient: LinearGradient(colors: p.colors), borderRadius: BorderRadius.circular(14)), child: Icon(p.icon, color: Colors.white, size: 38)),
                        const SizedBox(width: 14),
                        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                          Text(p.name, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                          Text(p.location, style: const TextStyle(color: Colors.grey)),
                          const SizedBox(height: 5),
                          Text('⭐ ${p.rating}', style: const TextStyle(fontWeight: FontWeight.bold)),
                        ])),
                        const Icon(Icons.favorite_border),
                      ]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
