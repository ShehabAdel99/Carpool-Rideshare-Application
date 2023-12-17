import 'package:flutter/material.dart';
import 'order_history_screen.dart'; // Import the OrderHistoryScreen
import 'package:firebase_auth/firebase_auth.dart';
import 'login_screen.dart';


class ProfileScreen extends StatelessWidget {
  // Dummy user information for demonstration purposes
  final String username = "Shehab Adel";
  final String email = "Shehab.Adel@example.com";
  final String phoneNumber = "123-456-7890";
  final String profileImageUrl = "assets/images/profile_picture.png"; // Replace with the actual path to the profile picture

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            // Navigate back to the HomeScreen when the logo is pressed
            Navigator.pushReplacementNamed(context, '/home');
          },
          child: Image.asset(
            'assets/images/carpool_icon.png',
            width: 60.0,
            height: 60.0,
          ),
        ),
        actions: [
          // Add a logout icon
          IconButton(
            icon: Icon(Icons.logout, color: Color(0xFF1267F8)),
            onPressed: () async {
              try {
              // Sign out from Firebase
              await FirebaseAuth.instance.signOut();

              _showSuccessNotification(context);

              // Navigate back to the login screen
              Navigator.pushReplacementNamed(context, '/login');
              } catch (e) {
              print("Error signing out: $e");
              // Handle any errors during sign out
              }
              },
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 16.0),
          CircleAvatar(
            radius: 80.0,
            backgroundImage: AssetImage(profileImageUrl),
          ),
          SizedBox(height: 24.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Username:',
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      username,
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Email:',
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      email,
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Phone Number:',
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      phoneNumber,
                      style: TextStyle(fontSize: 16.0),
                    ),
                    // Add more user details as needed
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Navigate to the EditProfileScreen
                  // You need to create a new screen for editing profile information
                  // and handle the editing logic there
                },
                child: Text('Edit Profile'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the OrderHistoryScreen
                  Navigator.pushReplacementNamed(context, '/history');
                },
                child: Text('Order History'),
              ),
            ],
          ),
        ],
      ),
    );
  }
  void _showSuccessNotification(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Successful login'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
      ),
    );
  }
}