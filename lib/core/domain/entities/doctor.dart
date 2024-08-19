//
// @Author: "Eldor Turgunov"
// @Date: 07.08.2024
// @File name: doctor.dart
//
class Doctor {
  final int id;
  final String firstName;
  final String lastName;
  final String? bio; // Null bo'lishi mumkin
  final String? address; // Null bo'lishi mumkin
  final String? category; // Null bo'lishi mumkin
  final String? phoneNumber; // Null bo'lishi mumkin
  final String? email; // Null bo'lishi mumkin
  final String? specialization; // Null bo'lishi mumkin
  // final int? experience; // Null bo'lishi mumkin
  final double? rating; // Null bo'lishi mumkin, double turga o'zgartirildi

  Doctor({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.bio,
    this.address,
    this.category,
    this.phoneNumber,
    this.email,
    this.specialization,
    // this.experience,
    this.rating,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: int.parse(json['id']),
      firstName: json['first_name'],
      lastName: json['last_name'],
      bio: json['bio'],
      address: json['address'],
      category: json['category'],
      phoneNumber: json['phone_number'],
      email: json['email'],
      specialization: json['specialization'],
      // experience:
      //     json['experience'] != null ? int.parse(json['experience']) : null,
      rating: json['rating'] != null ? double.parse(json['rating']) : null,
    );
  }
}
