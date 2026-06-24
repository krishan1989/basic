import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../services/auth_service.dart';
import '../services/profile_service.dart';

class ProfileScreen extends StatelessWidget {

  /// Dashboard se User ID receive hogi
  final int userId;

  const ProfileScreen({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Employee Profile",
        ),
        centerTitle: true,
      ),

      body: FutureBuilder<User>(

        /// API Call
        future:
        ProfileService.getProfile(
          userId,
        ),

        builder: (
            context,
            snapshot,
            ) {

          /// Loading State
          if (snapshot.connectionState ==
              ConnectionState.waiting) {

            return const Center(
              child:
              CircularProgressIndicator(),
            );
          }

          /// Error State
          if (snapshot.hasError) {

            return Center(

              child: Padding(

                padding:
                const EdgeInsets.all(20),

                child: Text(
                  snapshot.error.toString(),
                  textAlign:
                  TextAlign.center,
                ),
              ),
            );
          }

          /// Data Null Check
          if (!snapshot.hasData) {

            return const Center(
              child: Text(
                "No Data Found",
              ),
            );
          }

          /// User Object
          final user =
          snapshot.data!;

          return SingleChildScrollView(

            padding:
            const EdgeInsets.all(20),

            child: Column(

              children: [

                /// Profile Image
                CircleAvatar(

                  radius: 60,

                  backgroundImage:

                  user.photo.isNotEmpty

                      ? NetworkImage(
                    user.photo,
                  )

                      : null,

                  child:
                  user.photo.isEmpty

                      ? const Icon(
                    Icons.person,
                    size: 60,
                  )

                      : null,
                ),

                const SizedBox(
                  height: 20,
                ),

                /// Employee Name
                Text(

                  user.name,

                  style:
                  const TextStyle(

                    fontSize: 24,

                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),

                buildInfoCard(
                  icon: Icons.email,
                  title: "Email",
                  value: user.email,
                ),

                buildInfoCard(
                  icon: Icons.phone,
                  title: "Mobile",
                  value: user.mobile,
                ),

                buildInfoCard(
                  icon: Icons.work,
                  title: "Designation",
                  value:
                  user.designation,
                ),

                buildInfoCard(
                  icon: Icons.business,
                  title: "Department",
                  value:
                  user.department,
                ),

                const SizedBox(
                  height: 20,
                ),

                /// Edit Profile Button
                SizedBox(

                  width:
                  double.infinity,

                  child:
                  ElevatedButton.icon(

                    icon: const Icon(
                      Icons.edit,
                    ),

                    label: const Text(
                      "Edit Profile",
                    ),

                    onPressed: () {

                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(

                        const SnackBar(
                          content: Text(
                            "Edit Profile Coming Soon",
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  /// Reusable Profile Card
  Widget buildInfoCard({

    required IconData icon,

    required String title,

    required String value,

  }) {

    return Card(

      elevation: 3,

      margin:
      const EdgeInsets.only(
        bottom: 12,
      ),

      child: ListTile(

        leading: Icon(icon),

        title: Text(title),

        subtitle: Text(value),
      ),
    );
  }
}