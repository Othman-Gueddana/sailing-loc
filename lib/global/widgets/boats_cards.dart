import 'package:flutter/material.dart';

class BoatCard extends StatelessWidget {
  final String? title;
  final String? location;
  final int? seats;
  final bool? withCaptain;
  final String? price;
  final List imageURL;

  const BoatCard(
      {Key? key,
      required this.imageURL,
      required this.title,
      required this.location,
      required this.price,
      required this.seats,
      required this.withCaptain})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: 400,
        height: 430,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              fit: BoxFit.fill,
              image: NetworkImage(imageURL[0]!),
              width: 400,
              height: 250,
            ),
            SizedBox(height: 5),
            Text(
              " ${title}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.place_outlined),
                SizedBox(width: 4),
                Text(
                  location!,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.person_outline),
                SizedBox(width: 4),
                Text(
                  "${seats!} places",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(width: 8),
                Text('|'),
                SizedBox(width: 8),
                Icon(Icons.directions_ferry_outlined),
                SizedBox(width: 4),
                Text(
                  "${withCaptain! ? 'Skipper en option' : 'Bateau seul'}",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              "  ${price!} € par jour",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
