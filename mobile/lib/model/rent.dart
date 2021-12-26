
class Rent{
  final String id;
  final String title;
  final String owner;
  final String description;
  final String image;
  final int size;
  final int room_number;
  final String location;
  final num price_per_month;
  final String start_date_available;
  final String end_date_available;

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
  factory Rent.fromJson(Map<String, dynamic> json) {
    return Rent(
        id: json['id'],
        title: json['title'],
        owner: json['owner'],
        description: json['description'],
        image: json['image'],
        size: json['size'],
        room_number: json['room_number'],
        location: json['location'],
        price_per_month: json['price_per_month'],
        start_date_available: json['start_date_available'],
        end_date_available: json['end_date_available']
    );
  }

}