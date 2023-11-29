import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book List'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: const [
          BookCard('1', '2', '3', '4'),
          BookCard('1', '2', '3', '4'),
        ],
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final String bookName;
  final String authorName;
  final String bookRating;
  final String bookCover;

  const BookCard(
      this.bookName, this.authorName, this.bookRating, this.bookCover,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black45),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/images/book1.jpg",
                  scale: 5,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Harry Potter",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "J.K Rowling",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("5.0"),
                  Text("200"),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class BuyNowPage extends StatelessWidget {
  final String bookName;

  BuyNowPage(this.bookName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy Now'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Book Name: $bookName'),
            SizedBox(height: 16.0),
            Image.network(
                'book_cover_image_url_here'), // Replace with actual image URL
            SizedBox(height: 16.0),
            Text('Author: Author Name'),
            Text('Description: Short description goes here'),
            Text('Price: \$19.99'),
            SizedBox(height: 16.0),
            DropdownButton<String>(
              items: <String>['Option 1', 'Option 2', 'Option 3']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Handle dropdown value change
              },
              hint: Text('Select an option'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to the first page
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
