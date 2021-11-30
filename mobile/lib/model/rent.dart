import 'package:flutter/material.dart';

class Rent{
  final String id;
  final String title;
  final String owner;
  final String description;
  final Image image;
  final int size;
  final int room_number;
  final String location;
  final num price_per_month;
  final DateTime start_date_available;
  final DateTime end_date_available;

  const Rent({
    required this.id,
    required this.title,
    required this.owner,
    required this.description,
    required this.image,
    required this.size,
    required this.room_number,
    required this.location,
    required this.price_per_month,
    required this.start_date_available,
    required this.end_date_available,
  });
}