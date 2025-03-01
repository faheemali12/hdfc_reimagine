import 'package:flutter/material.dart';
import '../../utills/colors.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings",style: TextStyle(color: Colors.white,fontSize: 25),),
        backgroundColor: AppColors.primaryBlue,
      ),
      body: Container(
        color: AppColors.whiteGrey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Profile Section
              ListTile(
                leading: Icon(Icons.account_circle, color: AppColors.primaryBlue),
                title: Text(
                  "Profile",
                  style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  // Navigate to Profile screen
                },
              ),
              Divider(color: AppColors.greyLight),

              // Notifications Section
              ListTile(
                leading: Icon(Icons.notifications, color: AppColors.primaryBlue),
                title: Text(
                  "Notifications",
                  style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Enable or disable notifications",
                  style: TextStyle(color: AppColors.textSecondary),
                ),
                trailing: Switch(
                  value: true, // Assume the notification is ON
                  onChanged: (value) {
                    // Handle notification switch
                  },
                  activeColor: AppColors.primaryBlue,
                ),
              ),
              Divider(color: AppColors.greyLight),

              // Payment Settings Section
              ListTile(
                leading: Icon(Icons.payment, color: AppColors.primaryBlue),
                title: Text(
                  "Payment Settings",
                  style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  // Navigate to Payment settings
                },
              ),
              Divider(color: AppColors.greyLight),

              // App Preferences Section
              ListTile(
                leading: Icon(Icons.settings, color: AppColors.primaryBlue),
                title: Text(
                  "App Preferences",
                  style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  // Navigate to App Preferences screen
                },
              ),
              Divider(color: AppColors.greyLight),

              // Sign Out Section
              ListTile(
                leading: Icon(Icons.exit_to_app, color: AppColors.primaryRed),
                title: Text(
                  "Sign Out",
                  style: TextStyle(color: AppColors.primaryRed, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  // Handle Sign out
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
