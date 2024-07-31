import 'package:cloud_firestore/cloud_firestore.dart';

class BoatModel {
  final String? id;
  final List? imageUrl;
  final String? boat_location;
  final String? boat_type;
  final String? owner_name;
  final bool? withCaptain;
  final String? description;
  final String? engine;
  final List? external_equipment;
  final List? leisure_equipment;
  final List? navigation_equipment;
  final String? price;
  final int? seats;
  final int? surface;

  BoatModel(
      {this.id,
      this.boat_location,
      this.boat_type,
      this.owner_name,
      this.withCaptain,
      this.description,
      this.engine,
      this.external_equipment,
      this.leisure_equipment,
      this.navigation_equipment,
      this.price,
      this.seats,
      this.surface,
      this.imageUrl});

  static BoatModel fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return BoatModel(
        boat_location: snapshot['boat_location'],
        boat_type: snapshot['boat_type'],
        owner_name: snapshot['owner_name'],
        withCaptain: snapshot['withCaptain'],
        description: snapshot['description'],
        engine: snapshot['engine'],
        external_equipment: snapshot['external_equipment'],
        leisure_equipment: snapshot['leisure_equipment'],
        navigation_equipment: snapshot['navigation_equipment'],
        price: snapshot['price'],
        seats: snapshot['seats'],
        surface: snapshot['surface'],
        imageUrl: snapshot['imageUrl']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'boat_location': boat_location,
      'boat_type': boat_type,
      'owner_name': owner_name,
      'withCaptain': withCaptain,
      'description': description,
      'engine': engine,
      'external_equipment': external_equipment,
      'leisure_equipment': leisure_equipment,
      'navigation_equipment': navigation_equipment,
      'price': price,
      'seats': seats,
      'surface': surface,
      'imageUrl': imageUrl
    };
  }
}
