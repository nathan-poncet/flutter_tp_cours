import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp_cours/src/constants/app_sizes.dart';
import 'package:tp_cours/src/constants/paddings.dart';
import 'package:tp_cours/src/features/auth/presentation/auth_screen.dart';
import 'package:tp_cours/src/features/auth/repository/auth_repository.dart';
import 'package:tp_cours/src/features/properties/data/property.dart';
import 'package:tp_cours/src/features/properties/presentation/property_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

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

  final properties = [
    Property(
      city: 'Paris',
      country: 'France',
      date: '01/01/2022',
      imageUrl: 'https://a0.muscache.com/im/pictures/66631724/e2bb580b_original.jpg?im_w=1200',
      isFavorite: false,
      pricePerNight: 140,
      rate: 4.5,
    ),
    Property(
      city: 'Lyon',
      country: 'France',
      date: '01/01/2022',
      imageUrl: 'https://a0.muscache.com/im/pictures/6721fc25-afe0-4f35-b181-212ec8ddc186.jpg?im_w=720',
      isFavorite: false,
      pricePerNight: 110,
      rate: 4.5,
    ),
    Property(
      city: 'Marseille',
      country: 'France',
      date: '01/01/2022',
      imageUrl: 'https://a0.muscache.com/im/pictures/miso/Hosting-5264493/original/10d2c21f-84c2-46c5-b20b-b51d1c2c971a.jpeg?im_w=720',
      isFavorite: false,
      pricePerNight: 80,
      rate: 4.5,
    ),
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
              Consumer<AuthRepositoryProvider>(builder: (context, authRepositoryProvider, child) {
                final isLoggin = authRepositoryProvider.user != null;
                return IconButton(
                  icon: Icon(isLoggin ? Icons.account_circle_outlined : Icons.login),
                  onPressed: () {
                    if (isLoggin) {
                       Navigator.of(context).pushNamed('/account');
                    } else {
                      showModalBottomSheet(context: context, builder: (context) => const AuthScreen());
                    }
                  },
                );
              }),
            ]),
        body: Padding(
          padding: Paddings.page,
          child: ListView.separated(
            itemCount: properties.length,
            itemBuilder: (context, index) {
              return PropertyCard(property: properties[index]);
            },
            separatorBuilder: (context, index) => const SizedBox(height: Sizes.p26),
          ),
        ),
      ),
    );
  }
}
