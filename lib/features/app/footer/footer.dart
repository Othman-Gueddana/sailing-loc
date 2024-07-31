import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      color: Colors.white,
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        crossAxisAlignment: WrapCrossAlignment.start,
        alignment: WrapAlignment.spaceAround,
        children: [
          FooterColumn(
            title: 'Informations',
            items: [
              'À propos',
              'Recrutement',
              'Louer mon bateau',
              'Assurance',
              'SailingLoc Green',
              'SailingLoc Business',
              'Avis clients',
              'Blog',
              'Partenaires',
            ],
          ),
          FooterColumn(
            title: 'Nos locations',
            items: [
              'Location voilier',
              'Location catamaran',
              'Location bateau à moteur',
              'Location bateau semi-rigide',
              'Location bateau électrique',
              'Tous les bateaux',
            ],
          ),
          FooterColumn(
            title: 'Permis bateau',
            items: [
              'S’inscrire au permis côtier',
              'S’inscrire au code maritime',
              'Renseignements',
              'Les formations voile',
              'S’inscrire aux formations voile',
            ],
          ),
          FooterColumn(
            title: 'Où louer un bateau ?',
            items: [
              'Dieppe',
              'Arcachon',
              'La Rochelle',
              'Marseille',
              'Cannes',
              'Corse',
              'Europe (à venir)',
              'Toutes les destinations',
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Aide',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                  'Centre d\'aide | FAQ | Comment ça marche ? | Paiements | Contact'),
              SizedBox(height: 20),
              Text(
                '© SailingLoc 2023 - Tous droits réservés | Mentions Légales | Politique de confidentialité | CGV/CGU | Plan du site',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.facebook, color: Colors.blue),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.camera_alt, color: Colors.pink),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.music_note, color: Colors.green),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FooterColumn extends StatelessWidget {
  final String title;
  final List<String> items;

  FooterColumn({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        SizedBox(height: 10),
        ...items
            .map((item) => Text(
                  item,
                  style: TextStyle(fontSize: 15),
                ))
            .toList(),
      ],
    );
  }
}
