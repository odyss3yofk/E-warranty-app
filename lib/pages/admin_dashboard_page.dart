import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class AdminDashboardPage extends StatefulWidget {
  @override
  _AdminDashboardPageState createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  final _searchController = TextEditingController();
  final DatabaseReference _databaseRef = FirebaseDatabase.instance.ref().child('customers');
  Map<String, dynamic>? _customerData;

  void _searchCustomer() async {
    final customerName = _searchController.text.trim();

    if (customerName.isNotEmpty) {
      // Perform the search query
      final snapshot = await _databaseRef.orderByChild('name').equalTo(customerName).once();

      if (snapshot.snapshot.value != null) {
        final data = snapshot.snapshot.value as Map<dynamic, dynamic>;
        final customerKey = data.keys.first; // Retrieve the first matching customer
        setState(() {
          _customerData = Map<String, dynamic>.from(data[customerKey]);
        });
      } else {
        // If no customer found
        setState(() {
          _customerData = null; // Clear previous results
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Customer not found')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a customer name')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search Customer',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _searchCustomer,
              child: const Text('Search'),
            ),
            const SizedBox(height: 20),
            _customerData != null
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Customer Data:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text('Name: ${_customerData!['name']}'),
                Text('Address: ${_customerData!['address']}'),
                Text('Contact Number: ${_customerData!['contact_number']}'),
                Text('Machine Number: ${_customerData!['machine_number']}'),
                Text('Activation Date: ${_customerData!['activation_date']}'),
              ],
            )
                : const Text('No customer data found', style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
