import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../data/places_data.dart';
import '../../widgets/place_card.dart';
import '../details/place_details_screen.dart';
import '../emergency/emergency_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              const CircleAvatar(child: Icon(Icons.person)),
              const SizedBox(width: 12),
              const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Hello, Hassan 👋', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text('Where do you want to go?', style: const TextStyle(color: AppColors.textGrey)),
              ])),
              IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const EmergencyScreen())), icon: const Icon(Icons.notifications_none_rounded)),
            ]),
            const SizedBox(height: 22),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search destinations...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(onPressed: () {}, icon: const Icon(Icons.tune)),
              ),
            ),
            const SizedBox(height: 28),
            const Text('Popular Destinations', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: placesData.length,
                itemBuilder: (_, i) => PlaceCard(
                  place: placesData[i],
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PlaceDetailsScreen(place: placesData[i]))),
                ),
              ),
            ),
            const SizedBox(height: 28),
            const Text('Categories', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _Category(icon: Icons.beach_access_rounded, title: 'Beach'),
                _Category(icon: Icons.account_balance_rounded, title: 'History'),
                _Category(icon: Icons.park_rounded, title: 'Nature'),
                _Category(icon: Icons.hiking_rounded, title: 'Adventure'),
              ],
            ),
            const SizedBox(height: 28),
            const Text('Recommended For You', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            Container(
              height: 130,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF1D4ED8), Color(0xFF38BDF8)]),
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Row(children: [
                Icon(Icons.travel_explore_rounded, color: Colors.white, size: 55),
                SizedBox(width: 16),
                Expanded(child: Text('Your next adventure is waiting for you!', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class _Category extends StatelessWidget {
  final IconData icon;
  final String title;
  const _Category({required this.icon, required this.title});
  @override
  Widget build(BuildContext context) => Column(children: [
    Container(width: 55, height: 55, decoration: BoxDecoration(color: AppColors.primary.withOpacity(.1), borderRadius: BorderRadius.circular(16)), child: Icon(icon, color: AppColors.primary)),
    const SizedBox(height: 7),
    Text(title, style: const TextStyle(fontSize: 12)),
  ]);
}
