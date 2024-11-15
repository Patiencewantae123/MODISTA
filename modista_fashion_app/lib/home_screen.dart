import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> featuredImages = [
    {
      'url': 'https://example.com/image1.jpg',
      'title': 'Elegant Dress',
      'price': '\$120',
      'brand': 'Fashionista'
    },
    {
      'url': 'https://example.com/image2.jpg',
      'title': 'Summer Outfit',
      'price': '\$80',
      'brand': 'SunnyStyle'
    },
    {
      'url': 'https://example.com/image3.jpg',
      'title': 'Casual Look',
      'price': '\$50',
      'brand': 'CasualChic'
    },
  ];

  final List<Map<String, dynamic>> popularImages = [
    {
      'url': 'https://example.com/image4.jpg',
      'title': 'Sporty Vibe',
      'price': '\$90',
      'brand': 'ActiveWear'
    },
    {
      'url': 'https://example.com/image5.jpg',
      'title': 'Night Out',
      'price': '\$150',
      'brand': 'GlamourLine'
    },
    {
      'url': 'https://example.com/image6.jpg',
      'title': 'Street Style',
      'price': '\$65',
      'brand': 'UrbanTrends'
    },
  ];

  final List<String> categories = ['Casual', 'Formal', 'Sporty', 'Accessories'];
  String selectedCategory = 'Casual';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Modista Fashion')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Carousel Slider for Featured Images
              CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                ),
                items: featuredImages.map((imageData) {
                  return Builder(
                    builder: (BuildContext context) {
                      return GestureDetector(
                        onTap: () => _openDetails(imageData),
                        child: Card(
                          elevation: 5,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  imageData['url'],
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                  height: 150,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      imageData['title'],
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    Text(imageData['price'], style: TextStyle(color: Colors.pink)),
                                    Text(imageData['brand'], style: TextStyle(color: Colors.grey)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 20),

              // Categories Section with Filter
              Text(
                'Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = categories[index];
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: selectedCategory == categories[index] ? Colors.pink : Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            categories[index],
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),

              // Popular Fashion Items Section with Detailed Cards
              Text(
                'Popular Fashion',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: popularImages.length,
                  itemBuilder: (context, index) {
                    final imageData = popularImages[index];
                    return GestureDetector(
                      onTap: () => _openDetails(imageData),
                      child: Container(
                        width: 150,
                        margin: EdgeInsets.only(right: 10),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                imageData['url'],
                                fit: BoxFit.cover,
                                height: 150,
                                width: 150,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    imageData['title'],
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(imageData['price'], style: TextStyle(color: Colors.pink)),
                                  Text(imageData['brand'], style: TextStyle(color: Colors.grey)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openDetails(Map<String, dynamic> imageData) {
    // Code to navigate to details screen, passing `imageData`
  }
}
