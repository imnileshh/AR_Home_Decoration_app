import 'package:ARhomes/screens/profile_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountsPage extends StatefulWidget {
  const AccountsPage({Key? key}) : super(key: key);

  @override
  State<AccountsPage> createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            /// -- IMAGE
            Stack(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(
                          image: AssetImage('assets/images/profile.jpeg'))),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.blueGrey),
                    child: const Icon(
                      Icons.edit_note_rounded,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text("Shubham Waghmare",
                style: Theme.of(context).textTheme.headlineSmall),
            Text("Student", style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 20),

            /// -- BUTTON
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () => {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    side: BorderSide.none,
                    shape: const StadiumBorder()),
                child: const Text("Edit Profile",
                    style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 30),
            Divider(),
            const SizedBox(height: 10),

            /// -- MENU
            ProfileMenuWidget(
                title: "Settings", icon: Icons.settings, onPress: () {}),
            ProfileMenuWidget(
                title: "Billing Details", icon: Icons.wallet, onPress: () {}),
            ProfileMenuWidget(
                title: "User Management",
                icon: Icons.security_update_good_sharp,
                onPress: () {}),
            const Divider(),
            const SizedBox(height: 10),
            ProfileMenuWidget(
                title: "Information", icon: Icons.info, onPress: () {}),
            ProfileMenuWidget(
                title: "Logout",
                icon: Icons.logout,
                textColor: Colors.red,
                endIcon: false,
                onPress: () {
                  Get.defaultDialog(
                    title: "LOGOUT",
                    titleStyle: const TextStyle(fontSize: 20),
                    content: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Text("Are you sure, you want to Logout?"),
                    ),
                    confirm: Expanded(
                      child: ElevatedButton(
                        onPressed: () => FirebaseAuth.instance.signOut(),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            side: BorderSide.none),
                        child: const Text("Yes"),
                      ),
                    ),
                    cancel: OutlinedButton(
                      onPressed: () => Get.back(),
                      child: const Text("No"),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
