import 'package:flutter/material.dart';
import 'package:tp_cours/src/constants/paddings.dart';
import 'package:tp_cours/src/features/properties/data/property.dart';
import 'package:tp_cours/src/features/properties/presentation/property_card.dart';

class PropertiesScreen extends StatelessWidget {
  PropertiesScreen({super.key});

  final tabs = [
    const Tab(text: "Campagne", icon: Icon(Icons.landscape)),
    const Tab(text: "Mer", icon: Icon(Icons.beach_access)),
    const Tab(text: "Montagne", icon: Icon(Icons.terrain)),
    const Tab(text: "Ville", icon: Icon(Icons.location_city)),
    const Tab(text: "Arctique", icon: Icon(Icons.landscape)),
    const Tab(text: "Désert", icon: Icon(Icons.beach_access)),
    const Tab(text: "Forêt", icon: Icon(Icons.terrain)),
    const Tab(text: "Jungle", icon: Icon(Icons.location_city)),
    const Tab(text: "Lac", icon: Icon(Icons.landscape)),
    const Tab(text: "Plage", icon: Icon(Icons.beach_access)),
    const Tab(text: "Savane", icon: Icon(Icons.terrain)),
    const Tab(text: "Toundra", icon: Icon(Icons.location_city)),
    const Tab(text: "Volcan", icon: Icon(Icons.landscape)),
    const Tab(text: "Zénith", icon: Icon(Icons.beach_access)),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
            bottom: TabBar(
              tabs: tabs,
              isScrollable: true,
            ),
            title: const TextField(
              decoration: InputDecoration(
                hintText: "Rechercher",
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {},
              ),
            ]),
        body: Padding(
          padding: Paddings.page,
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return PropertyCard(
                  property: Property(
                city: 'Paris',
                country: 'France',
                date: '01/01/2022',
                imageUrl: 'https://a0.muscache.com/im/pictures/66631724/e2bb580b_original.jpg?im_w=1200',
                isFavorite: false,
                pricePerNight: 100,
                rate: 4.5,
              ));
            },
          ),
        ),
      ),
    );
  }
}
