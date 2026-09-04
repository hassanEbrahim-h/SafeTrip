import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../emergency/emergency_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [AppColors.darkBlue, AppColors.primary]),
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Column(children: [
              CircleAvatar(radius: 42, backgroundColor: Colors.white, child: Icon(Icons.person, size: 50, color: AppColors.primary)),
              SizedBox(height: 12),
              Text('Hassan Ebrahim', style: TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold)),
              Text('hassan@example.com', style: TextStyle(color: Colors.white70)),
            ]),
          ),
          const SizedBox(height: 20),
          _Item(Icons.person_outline, 'Personal Information'),
          _Item(Icons.favorite_border, 'Favorite Places'),
          _Item(Icons.luggage_outlined, 'My Trips'),
          _Item(Icons.notifications_none, 'Notifications'),
          _Item(Icons.dark_mode_outlined, 'Dark Mode'),
          _Item(Icons.language, 'Language', trailing: 'English'),
          _Item(Icons.emergency_outlined, 'Emergency Services', onTap: (context) => Navigator.push(context, MaterialPageRoute(builder: (_) => const EmergencyScreen()))),
          const SizedBox(height: 10),
          TextButton.icon(onPressed: () {}, icon: const Icon(Icons.logout, color: Colors.red), label: const Text('Logout', style: TextStyle(color: Colors.red))),
        ]),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final IconData icon; final String title; final String? trailing; final void Function(BuildContext)? onTap;
  const _Item(this.icon, this.title, {this.trailing, this.onTap});
  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap == null ? null : () => onTap!(context),
    child: Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(children: [
        Icon(icon, color: AppColors.primary),
        const SizedBox(width: 14),
        Expanded(child: Text(title)),
        if (trailing != null) Text(trailing!, style: const TextStyle(color: AppColors.textGrey)),
        const SizedBox(width: 8),
        const Icon(Icons.arrow_forward_ios, size: 15),
      ]),
    ),
  );
}
