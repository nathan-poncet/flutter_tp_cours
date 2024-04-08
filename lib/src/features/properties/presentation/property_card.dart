import 'package:flutter/material.dart';
import 'package:tp_cours/src/constants/app_sizes.dart';
import 'package:tp_cours/src/features/properties/data/property.dart';

class PropertyCard extends StatelessWidget {
  const PropertyCard({super.key, required this.property});

  final Property property;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          Stack(
            children: [
              AspectRatio(aspectRatio: 1, child: Image.network(property.imageUrl, fit: BoxFit.cover)),
              Positioned(
                right: Sizes.p12,
                top: Sizes.p12,
                child: IconButton(
                  icon: Icon(property.isFavorite ? Icons.favorite : Icons.favorite_border),
                  onPressed: () {},
                ),
              ),
              /* Coup de coeur voyageur */
              Positioned(
                left: Sizes.p12,
                top: Sizes.p12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.p8, vertical: Sizes.p4),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(Sizes.p8),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.favorite, color: Colors.pinkAccent),
                      gapW4,
                      Text("Coup de coeur voyageur", style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(Sizes.p12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${property.city}, ${property.country}", style: Theme.of(context).textTheme.titleSmall),
                    Row(
                      children: [
                        const Icon(Icons.star),
                        Text(property.rate.toString(), style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    )
                  ],
                ),
                Text(property.date, style: Theme.of(context).textTheme.bodyMedium),
                Text("${property.pricePerNight}€ par nuit", style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
