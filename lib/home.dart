import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'login.dart'; // Import the LoginPage here

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _profileImage;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      appBar: appBar(),
      drawer: drawerList(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            personalInfo(),
            professionalGoals(),
            const SizedBox(height: 20),
            logoutButton(context), // Added logout button
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'MY CV',
        style: TextStyle(
          fontSize: 18,
          color: Color(0xffffffff),
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: const Color(0xff2398F7),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    );
  }

  Drawer drawerList(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildHeader(),
          _buildItem(
            icon: Icons.school,
            title: 'Education',
            onTap: () => Navigator.pop(context),
          ),
          _buildItem(
            icon: Icons.handyman,
            title: 'Skills',
            onTap: () => Navigator.pop(context),
          ),
          _buildItem(
            icon: Icons.assignment,
            title: 'Project',
            onTap: () => Navigator.pop(context),
          ),
          _buildItem(
            icon: Icons.work,
            title: 'Experience',
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return const DrawerHeader(
      decoration: BoxDecoration(color: Color(0xff2398F7)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'CV Sections',
            style: TextStyle(
              fontSize: 28,
              color: Color(0xfff4f4f4),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem({required IconData icon, required String title, required GestureTapCallback onTap}) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          onTap: onTap,
          minLeadingWidth: 5,
        ),
        const Divider(
          color: Colors.grey,
          height: 1,
          thickness: 1,
        ),
      ],
    );
  }

  Container personalInfo() {
    return Container(
      width: double.infinity,
      height: 350,
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: _pickImage,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: const Color(0xff2398F7),
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: ClipOval(
                child: _profileImage != null
                    ? Image.file(
                        _profileImage!,
                        fit: BoxFit.cover,
                        width: 150,
                        height: 150,
                      )
                    : const Center(
                        child: Text(
                          'M',
                          style: TextStyle(
                            fontSize: 64,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            'Mark Angelo Baricante',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            '(+63) 951-611-2324',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'angelobaricante@gmail.com',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Container professionalGoals() {
    return Container(
      width: double.infinity,
      height: 270,
      padding: const EdgeInsets.only(
        right: 25,
        left: 25,
      ),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Professional Goal',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'My goal is to leverage data analysis and visualization skills to extract actionable insights and drive data-driven decisions. \n\nI aim to continuously expand my expertise in statistical analysis and machine learning to contribute to business success.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget logoutButton(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to the LoginPage and replace the current page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff2398F7),
            foregroundColor: Colors.white,
            elevation: 0, // Set elevation to 0 for a flat design
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // Slightly rounded corners
            ),
          ),
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
