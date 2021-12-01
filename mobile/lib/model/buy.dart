 
import 'package:flutter/material.dart';

class Buy{
  final String id;
  final String title;
  final String owner;
  final String description;
  final Image image;
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
}