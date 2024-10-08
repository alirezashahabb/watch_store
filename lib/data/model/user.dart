import 'dart:convert';

class UserModel {
  final String name;
  final String phone;
  final String address;
  final String postalCode;
  final image;
  final double lat;
  final double lng;

  UserModel({
    required this.name,
    required this.phone,
    required this.address,
    required this.postalCode,
    required this.image,
    required this.lat,
    required this.lng,
  });

  /// for send params to server

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'address': address,
      'postal_code': postalCode,
      'image': image,
      'lat': lat,
      'lng': lng,
    };
  }

  /// convert jsonObject to map dart
  factory UserModel.fromJson(String? jsonString) {
    Map<String, dynamic> map = jsonDecode(jsonString!);
    return UserModel(
        name: map['name'],
        phone: map['phone'],
        address: map['address'],
        postalCode: map['postal_code'],
        image: map['image'],
        lat: map['lat'],
        lng: map['lng']);
  }
}
