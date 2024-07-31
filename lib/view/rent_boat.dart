import 'package:flutter/material.dart';
import 'package:sailing_loc/global/widgets/boats_cards.dart';
import 'package:sailing_loc/model/boat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RentBoat extends StatefulWidget {
  const RentBoat({super.key});

  @override
  State<RentBoat> createState() => _RentBoatState();
}

class _RentBoatState extends State<RentBoat> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Location de bateaux SailingLoc",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 450,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return StreamBuilder<List<BoatModel>>(
                  stream: _readData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    final boats = snapshot.data;
                    return Container(
                      height: 450,
                      child: StreamBuilder<List<BoatModel>>(
                        stream: _readData(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          }

                          final boats = snapshot.data;
                          return Container(
                            height: 450,
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.start,
                                alignment: WrapAlignment.start,
                                runAlignment: WrapAlignment.start,
                                spacing: 10,
                                // gap between adjacent items
                                runSpacing: 10,
                                // gap between lines
                                children: boats!.map((boat) {
                                  return BoatCard(
                                    imageURL: boat.imageUrl!,
                                    title: boat.boat_type!,
                                    location: boat.boat_location!,
                                    seats: boat.seats!,
                                    withCaptain: boat.withCaptain!,
                                    price: boat.price!,
                                  );
                                }).toList(),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Stream<List<BoatModel>> _readData() {
    final boatCollection = FirebaseFirestore.instance.collection("boats");

    return boatCollection
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs.map((e) {
              return BoatModel.fromSnapshot(e);
            }).toList());
  }
}
