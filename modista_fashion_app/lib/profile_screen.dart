import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isEditing = false;

  // Text editing controllers for user input
  TextEditingController nameController = TextEditingController(text: 'Liam vibes');
  TextEditingController bioController = TextEditingController(text: 'Fashion Enthusiast');
  TextEditingController emailController = TextEditingController(text: 'liamvibes@example.com');

  @override
  void dispose() {
    nameController.dispose();
    bioController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage('https://example.com/profile-picture.jpg'),
                ),
              ),
              SizedBox(height: 20),
              isEditing
                  ? TextField(
                      controller: nameController,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                      decoration: InputDecoration(
                        hintText: 'Enter your name',
                        border: UnderlineInputBorder(),
                      ),
                    )
                  : Text(
                      nameController.text,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                    ),
              SizedBox(height: 10),
              isEditing
                  ? TextField(
                      controller: bioController,
                      style: TextStyle(fontSize: 16, color: Colors.blueAccent),
                      decoration: InputDecoration(
                        hintText: 'Enter your bio',
                        border: UnderlineInputBorder(),
                      ),
                    )
                  : Text(
                      bioController.text,
                      style: TextStyle(fontSize: 16, color: Colors.blueAccent),
                    ),
              SizedBox(height: 10),
              isEditing
                  ? TextField(
                      controller: emailController,
                      style: TextStyle(fontSize: 16, color: Colors.blueAccent),
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                        border: UnderlineInputBorder(),
                      ),
                    )
                  : Text(
                      emailController.text,
                      style: TextStyle(fontSize: 16, color: Colors.blueAccent),
                    ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isEditing = !isEditing; // Toggle edit mode
                      });
                    },
                    child: Text(isEditing ? 'Save Changes' : 'Edit Profile'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                  ),
                  IconButton(
                    icon: Icon(Icons.settings, color: Colors.blueAccent),
                    onPressed: () {
                      // Navigate to settings page
                    },
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(
                'My Orders',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent),
              ),
              Divider(),
              ListTile(
                title: Text('Order #12345'),
                subtitle: Text('Completed on Oct 15, 2024'),
                leading: Icon(Icons.shopping_cart),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to order details page
                },
              ),
              ListTile(
                title: Text('Order #12346'),
                subtitle: Text('Completed on Oct 10, 2024'),
                leading: Icon(Icons.shopping_cart),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to order details page
                },
              ),
              SizedBox(height: 30),
              Text(
                'Preferences',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.notifications, color: Colors.blueAccent),
                title: Text('Notifications'),
                trailing: Switch(
                  value: true,
                  onChanged: (value) {
                    // Handle notification preference change
                  },
                  activeColor: Colors.blueAccent,
                ),
              ),
              ListTile(
                leading: Icon(Icons.language, color: Colors.blueAccent),
                title: Text('Language'),
                onTap: () {
                  // Navigate to language settings
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
