import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  final List<Map<String, String>> trendingItems = [
    {'image': 'https://example.com/image1.jpg', 'title': 'Elegant Dress'},
    {'image': 'https://example.com/image2.jpg', 'title': 'Summer Collection'},
    {'image': 'https://example.com/image3.jpg', 'title': 'Casual Style'},
  ];

  final List<Map<String, String>> categories = [
    {'icon': 'https://example.com/casual.png', 'label': 'Casual'},
    {'icon': 'https://example.com/formal.png', 'label': 'Formal'},
    {'icon': 'https://example.com/sporty.png', 'label': 'Sporty'},
    {'icon': 'https://example.com/accessories.png', 'label': 'Accessories'},
  ];

  final List<Map<String, String>> popularBrands = [
    {'image': 'https://example.com/brand1.jpg', 'name': 'Brand A'},
    {'image': 'https://example.com/brand2.jpg', 'name': 'Brand B'},
    {'image': 'https://example.com/brand3.jpg', 'name': 'Brand C'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore'),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: _pickImage, // Opens the camera
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueAccent),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        'https://example.com/profile-picture.jpg'), // Replace with profile image URL
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Liam Vibes',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    'Fashion Enthusiast',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.blueAccent),
              title: Text('Home', style: TextStyle(color: Colors.blue)),
              onTap: () {
                // Navigate to Home
              },
            ),
            ListTile(
              leading: Icon(Icons.category, color: Colors.blueAccent),
              title: Text('Categories', style: TextStyle(color: Colors.blue)),
              onTap: () {
                // Navigate to Categories
              },
            ),
            ListTile(
              leading: Icon(Icons.star, color: Colors.blueAccent),
              title: Text('Trending', style: TextStyle(color: Colors.blue)),
              onTap: () {
                // Navigate to Trending
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.blueAccent),
              title: Text('Settings', style: TextStyle(color: Colors.blue)),
              onTap: () {
                // Navigate to Settings
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display the captured image (if any)
              if (_image != null) ...[
                Container(
                  margin: EdgeInsets.only(bottom: 16.0),
                  child: Image.file(_image!),
                ),
              ],

              // Section: Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search for trends, brands...',
                  prefixIcon: Icon(Icons.search, color: Colors.blueAccent),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                ),
              ),
              SizedBox(height: 24),

              // Section: Trending Now
              Text(
                'Trending Now',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent),
              ),
              SizedBox(height: 10),
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: trendingItems.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 140,
                      margin: EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              trendingItems[index]['image']!,
                              fit: BoxFit.cover,
                              width: 140,
                              height: 140,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            trendingItems[index]['title']!,
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 24),

              // Section: Categories
              Text(
                'Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent),
              ),
              SizedBox(height: 10),
              Container(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 80,
                      margin: EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(categories[index]['icon']!),
                          ),
                          SizedBox(height: 5),
                          Text(
                            categories[index]['label']!,
                            style: TextStyle(fontSize: 12, color: Colors.blue),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 24),

              // Section: Popular Brands
              Text(
                'Popular Brands',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent),
              ),
              SizedBox(height: 10),
              Container(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: popularBrands.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 100,
                      margin: EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              popularBrands[index]['image']!,
                              fit: BoxFit.cover,
                              width: 100,
                              height: 80,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            popularBrands[index]['name']!,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 24),

              // Section: Recommended for You
              Text(
                'Recommended for You',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent),
              ),
              SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: trendingItems.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.blueAccent.withOpacity(0.3)),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            trendingItems[index]['image']!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 120,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                trendingItems[index]['title']!,
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 5),
                              Text(
                                '\$120', // Example price
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
