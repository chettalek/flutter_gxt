class Employee {
  String id;
  String name;
  String position;
  String email;
  String phone;

  Employee({
    required this.id,
    required this.name,
    required this.position,
    required this.email,
    required this.phone,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      name: json['name'],
      position: json['position'],
      email: json['email'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'position': position,
    'email': email,
    'phone': phone,
  };
}
