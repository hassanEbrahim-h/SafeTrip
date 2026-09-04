import 'package:flutter/material.dart';
import '../../data/trips_data.dart';
import '../../core/constants/app_colors.dart';
import 'trip_planner_screen.dart';

class MyTripsScreen extends StatelessWidget {
  const MyTripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TripPlannerScreen())),
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          icon: const Icon(Icons.add),
          label: const Text('New Trip'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('My Trips', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Manage your upcoming adventures', style: TextStyle(color: AppColors.textGrey)),
            const SizedBox(height: 22),
            Expanded(
              child: ListView.separated(
                itemCount: tripsData.length,
                separatorBuilder: (_, __) => const SizedBox(height: 14),
                itemBuilder: (_, i) {
                  final t = tripsData[i];
                  final completed = t.status == 'Completed';
                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
                    child: Row(children: [
                      Container(width: 65, height: 65, decoration: BoxDecoration(color: AppColors.primary.withOpacity(.1), borderRadius: BorderRadius.circular(14)), child: const Icon(Icons.luggage_rounded, color: AppColors.primary)),
                      const SizedBox(width: 14),
                      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(t.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                        Text(t.destination, style: const TextStyle(color: AppColors.textGrey)),
                        const SizedBox(height: 4),
                        Text(t.date, style: const TextStyle(fontSize: 12)),
                      ])),
                      Chip(label: Text(t.status), backgroundColor: (completed ? Colors.grey : AppColors.success).withOpacity(.15)),
                    ]),
                  );
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
