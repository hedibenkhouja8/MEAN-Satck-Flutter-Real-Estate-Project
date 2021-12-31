class Agency{
  final String id;
  final String owner;
  final String mail;
  final String phone;
  final String image_owner;
  final String location;
  final String image_location;
  final String description;
  final String siege_social;
  final String date_creation;
  final String horaire;

  const Agency({
    required this.id,
    required this.owner,
    required this.mail,
    required this.phone,
    required this.image_owner,
    required this.location,
    required this.image_location,
    required this.description,
    required this.siege_social,
    required this.date_creation,
    required this.horaire,
  });
  factory Agency.fromJson(Map<String, dynamic> json) {
    return Agency(
        id: json['id'],
        owner: json['owner'],
      mail: json['mail'],
      phone: json['phone'],
      image_owner: json['image_owner'],
      location: json['location'],
      image_location: json['image_location'],
        description: json['description'],
      siege_social: json['siege_social'],
      date_creation: json['date_creation'],
      horaire: json['horaire'],

    );
  }

}