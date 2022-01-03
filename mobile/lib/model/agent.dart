class Agent {
  final String id;
  final String name;
  final String mail;
  final String phone;
  final String image;
  final String location;

  const Agent({
    required this.id,
    required this.name,
    required this.mail,
    required this.phone,
    required this.image,
    required this.location,
  });
  factory Agent.fromJson(Map<String, dynamic> json) {
    return Agent(
      id: json['id'],
      name: json['name'],
      mail: json['mail'],
      phone: json['phone'],
      image: json['image'],
      location: json['location'],
    );
  }
}
