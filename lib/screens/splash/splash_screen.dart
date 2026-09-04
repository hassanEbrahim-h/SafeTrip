import 'dart:async';
import 'package:flutter/material.dart';
import '../../widgets/main_scaffold.dart';
import '../../core/constants/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const OnboardingScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [AppColors.darkBlue, AppColors.primary, AppColors.secondary], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.flight_takeoff_rounded, color: Colors.white, size: 100),
            SizedBox(height: 24),
            Text('SafeTrip', style: TextStyle(color: Colors.white, fontSize: 42, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Travel Smarter, Explore Better', style: TextStyle(color: Colors.white70, fontSize: 16)),
            SizedBox(height: 60),
            CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  int page = 0;

  final data = const [
    (Icons.explore_rounded, 'Explore New Places', 'Discover amazing destinations around Egypt.'),
    (Icons.map_rounded, 'Plan Your Journey', 'Organize your trip easily and save your favorite places.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const AuthScreen())),
                child: const Text('Skip'),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: data.length,
                onPageChanged: (v) => setState(() => page = v),
                itemBuilder: (_, i) => Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 220,
                        width: 220,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(data[i].$1, size: 100, color: AppColors.primary),
                      ),
                      const SizedBox(height: 45),
                      Text(data[i].$2, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 15),
                      Text(data[i].$3, textAlign: TextAlign.center, style: const TextStyle(color: AppColors.textGrey, fontSize: 16)),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(2, (i) => AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                width: page == i ? 28 : 10,
                height: 10,
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(color: page == i ? AppColors.primary : AppColors.border, borderRadius: BorderRadius.circular(10)),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    if (page == 0) {
                      controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                    } else {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const AuthScreen()));
                    }
                  },
                  child: Text(page == 0 ? 'Next' : 'Get Started'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool signup = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(signup ? 'Create Account' : 'Welcome Back')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 35),
            Icon(signup ? Icons.person_add_alt_1_rounded : Icons.lock_person_rounded, size: 85, color: AppColors.primary),
            const SizedBox(height: 30),
            if (signup) const TextField(decoration: InputDecoration(labelText: 'Full Name')),
            if (signup) const SizedBox(height: 15),
            const TextField(decoration: InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email_outlined))),
            const SizedBox(height: 15),
            const TextField(obscureText: true, decoration: InputDecoration(labelText: 'Password', prefixIcon: Icon(Icons.lock_outline))),
            if (signup) ...[
              const SizedBox(height: 15),
              const TextField(obscureText: true, decoration: InputDecoration(labelText: 'Confirm Password', prefixIcon: Icon(Icons.lock_outline))),
            ],
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const MainScaffold())),
                child: Text(signup ? 'Create Account' : 'Login'),
              ),
            ),
            const SizedBox(height: 15),
            TextButton(
              onPressed: () => setState(() => signup = !signup),
              child: Text(signup ? 'Already have an account? Login' : "Don't have an account? Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
