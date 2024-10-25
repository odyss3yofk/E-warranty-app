import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';  // Import Firebase Core
import 'package:projects/pages/home.dart';  // Your existing HomePage
import 'package:projects/pages/qr_scan_page.dart';  // Import the QRScanPage
import 'package:projects/pages/admin_login_page.dart';  // Import the AdminLoginPage
import 'package:projects/pages/admin_dashboard_page.dart';  // Import the AdminDashboardPage

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();  // Ensure initialization
  await Firebase.initializeApp();  // Initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Monteserrat'),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        '/qr': (context) => QRScanPage(),  // Register the QRScanPage route
        '/admin-login': (context) => AdminLoginPage(),  // Register the AdminLoginPage route
        '/admin-dashboard': (context) => AdminDashboardPage(),  // Register the AdminDashboardPage route
      },
    );
  }
}
