import 'package:cloud_firestore/cloud_firestore.dart';

class Seller {
  const Seller({
    required this.id,
    required this.name,
    required this.phone,
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  factory Seller.fromJson(Map<String, dynamic> json, [String? id]) {
    return Seller(
      name: json['name'],
      phone: json['phone'],
      address: json['address'],
      latitude: (json['localization'] as GeoPoint).latitude,
      longitude: (json['localization'] as GeoPoint).longitude,
      id: id ?? json['id'] ?? '',
    );
  }

  final String id;
  final String name;
  final String phone;
  final String address;
  final double latitude;
  final double longitude;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'localization': GeoPoint(latitude, longitude),
      'address': address,
    };
  }
}
