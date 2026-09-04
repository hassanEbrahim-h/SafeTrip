import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../data/places_data.dart';

class TripPlannerScreen extends StatefulWidget {
  final String? destination;
  const TripPlannerScreen({super.key, this.destination});

  @override
  State<TripPlannerScreen> createState() => _TripPlannerScreenState();
}

class _TripPlannerScreenState extends State<TripPlannerScreen> {
  late String selected;
  @override
  void initState() {
    super.initState();
    selected = widget.destination ?? placesData.first.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Plan Your Trip')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Create your perfect journey', style: TextStyle(color: AppColors.textGrey)),
          const SizedBox(height: 25),
          const TextField(decoration: InputDecoration(labelText: 'Trip Name', hintText: 'Summer Vacation')),
          const SizedBox(height: 18),
          const TextField(readOnly: true, decoration: InputDecoration(labelText: 'Select Dates', suffixIcon: Icon(Icons.calendar_month))),
          const SizedBox(height: 25),
          const Text('Select Destination', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          ...placesData.map((p) => RadioListTile<String>(
            value: p.name,
            groupValue: selected,
            onChanged: (v) => setState(() => selected = v!),
            title: Text(p.name),
            subtitle: Text(p.location),
            secondary: Icon(p.icon, color: AppColors.primary),
          )),
          const SizedBox(height: 25),
          SizedBox(width: double.infinity, height: 54, child: ElevatedButton(
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Trip created successfully!'))),
            child: const Text('Create Trip'),
          )),
        ]),
      ),
    );
  }
}
