import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Review {
  final String name;
  final String comment;
  final double rating;

  Review({required this.name, required this.comment, required this.rating});
}

class ReviewPage extends StatelessWidget {
  final List<Review> reviews = [
    Review(name: 'Alice', comment: 'Ótimo camping!', rating: 5.0),
    Review(name: 'Alice', comment: 'Ótimo camping!', rating: 5.0),
    Review(name: 'Alice', comment: 'Ótimo camping!', rating: 5.0),
    Review(name: 'Alice', comment: 'Ótimo camping!', rating: 5.0),
    Review(name: 'Alice', comment: 'Ótimo camping!', rating: 5.0),
    Review(name: 'Alice', comment: 'Ótimo camping!', rating: 5.0),
    Review(name: 'Alice', comment: 'Ótimo camping!', rating: 5.0),
    Review(name: 'Alice', comment: 'Ótimo camping!', rating: 5.0),
    Review(name: 'Alice', comment: 'Ótimo camping!', rating: 5.0),
    Review(name: 'Alice', comment: 'Ótimo camping!', rating: 5.0),
    Review(name: 'Alice', comment: 'Ótimo camping!', rating: 5.0),
    Review(name: 'Alice', comment: 'Ótimo camping!', rating: 5.0),

    Review(name: 'Alice', comment: 'Ótimo camping!', rating: 5.0),
    Review(name: 'Alice', comment: 'Ótimo camping!', rating: 5.0),
    Review(name: 'Alice', comment: 'Ótimo camping!', rating: 5.0),
    Review(name: 'Alice', comment: 'Ótimo camping!', rating: 5.0),
    Review(name: 'Alice', comment: 'Ótimo camping!', rating: 5.0),
    Review(name: 'Alice', comment: 'Ótimo camping!', rating: 5.0),
    Review(name: 'Alice', comment: 'Ótimo camping!', rating: 5.0),
    Review(name: 'Alice', comment: 'Ótimo camping!', rating: 5.0),
    Review(name: 'Alice', comment: 'Ótimo camping!', rating: 5.0),
    Review(name: 'Alice', comment: 'Ótimo camping!', rating: 5.0),
    Review(name: 'Alice', comment: 'Ótimo camping!', rating: 5.0),
    Review(name: 'Alice', comment: 'Ótimo camping!', rating: 5.0),
    Review(name: 'Alice', comment: 'Ótimo camping!', rating: 5.0),
    Review(name: 'Alice', comment: 'Ótimo camping!', rating: 5.0),
    Review(name: 'Alice', comment: 'Ótimo camping!', rating: 5.0),
    Review(name: 'Alice', comment: 'Ótimo camping!', rating: 5.0),
    Review(name: 'Alice', comment: 'Ótimo camping!', rating: 5.0),
    Review(name: 'Alice', comment: 'Ótimo camping!', rating: 5.0),
    Review(name: 'Alice', comment: 'Ótimo camping!', rating: 5.0),
    Review(name: 'Alice', comment: 'Ótimo camping!', rating: 5.0),
    Review(name: 'Alice', comment: 'Ótimo camping!', rating: 5.0),
    Review(name: 'Alice', comment: 'Ótimo camping!', rating: 5.0),
    Review(name: 'Alice', comment: 'Ótimo camping!', rating: 5.0),
    Review(name: 'Alice', comment: 'Ótimo camping!', rating: 5.0),
    Review(name: 'Alice', comment: 'Ótimo camping!', rating: 5.0),
    Review(name: 'Alice', comment: 'Ótimo camping!', rating: 5.0),
    Review(name: 'Alice', comment: 'Ótimo camping!', rating: 5.0),
    // Adicione mais reviews aqui...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Reviews',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.person, color: Colors.white),
                    backgroundColor: Colors.grey[700],
                  ),
                  title: Text(reviews[index].name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(reviews[index].comment,
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[600])),
                      RatingBarIndicator(
                        rating: reviews[index].rating,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 20.0,
                        direction: Axis.horizontal,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Adicione a ação para adicionar novo review
        },
        child: Icon(Icons.add), // Alterado para ícone de adicionar
        tooltip: 'Adicionar Review',
      ),
    );
  }
}
