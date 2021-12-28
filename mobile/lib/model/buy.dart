 
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
class Buy{
  final String id;
  final String title;
  final String owner;
  final String description;
  final String image;
  final int size;
  final int room_number;
  final String location;
  final num price;
  const Buy({
    required this.id,
    required this.title,
    required this.owner,
    required this.description,
    required this.image,
    required this.size,
    required this.room_number,
    required this.location,
    required this.price
  });
  factory Buy.fromJson(Map<String, dynamic> json) {
    return Buy(
        id: json['id'],
        title: json['title'],
        owner: json['owner'],
        description: json['description'],
        image: json['image'],
        size: json['size'],
        room_number: json['room_number'],
        location: json['location'],
        price: json['price']
    );
  }
}