import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      ('Ambulance', '123', Icons.emergency_rounded, AppColors.danger),
      ('Police', '122', Icons.local_police_rounded, AppColors.primary),
      ('Fire Department', '180', Icons.fire_truck_rounded, AppColors.warning),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Emergency Services')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Call Emergency', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 18),
          Row(children: services.map((s) => Expanded(
            child: Container(
              height: 130,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: s.$4.withOpacity(.1), borderRadius: BorderRadius.circular(18)),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(s.$3, color: s.$4, size: 34),
                const SizedBox(height: 7),
                Text(s.$1, textAlign: TextAlign.center, style: const TextStyle(fontSize: 11)),
                Text(s.$2, style: TextStyle(fontSize: 22, color: s.$4, fontWeight: FontWeight.bold)),
              ]),
            ),
          )).toList()),
          const SizedBox(height: 30),
          const Text('Nearby Services', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),
          ...const [
            _Nearby(Icons.local_hospital_rounded, 'Hospitals', 'Find nearest hospitals'),
            _Nearby(Icons.local_pharmacy_rounded, 'Pharmacies', 'Find nearest pharmacies'),
            _Nearby(Icons.shield_rounded, 'Tourist Police', 'Emergency tourist support'),
          ],
        ]),
      ),
    );
  }
}

class _Nearby extends StatelessWidget {
  final IconData icon; final String title; final String subtitle;
  const _Nearby(this.icon, this.title, this.subtitle);
  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
    child: Row(children: [
      CircleAvatar(backgroundColor: AppColors.primary.withOpacity(.1), child: Icon(icon, color: AppColors.primary)),
      const SizedBox(width: 14),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.bold)), Text(subtitle, style: const TextStyle(color: AppColors.textGrey, fontSize: 12))])),
      const Icon(Icons.arrow_forward_ios, size: 16),
    ]),
  );
}
