import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

class Favorities extends StatefulWidget {
  const Favorities({super.key});

  @override
  State<Favorities> createState() => _FavoritiesState();
}

class _FavoritiesState extends State<Favorities> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    final List<FoodItem> favFood = provider.products;
    final orientation = MediaQuery.of(context).orientation;

    return ListView.builder(
      itemCount: favFood.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                    leading: Image.network(
                      favFood[index].imgUrl,
                      height: 110,
                      width: 90,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      favFood[index].name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      '${favFood[index].category} - \$${favFood[index].price}',
                      style: const TextStyle(
                        fontSize: 14,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: orientation == Orientation.portrait
                        ? IconButton(
                            onPressed: () {
                              provider.toggleFavorite(favFood[index]);
                            },
                            icon: Icon(
                              !provider.isExist(favFood[index])
                                  ? Icons.favorite_border
                                  : Icons.favorite,
                              color: Colors.deepOrange,
                            ),
                          )
                        : TextButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_rounded),
                            label: Text("Favorite"),
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.deepOrange),
                          ))));
      },
    );
  }
}
