import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

class ProductItemWidget extends StatefulWidget {
  final BoxConstraints constraints;
  final int index;
  final List<FoodItem> filteredFood;
  const ProductItemWidget(
      {super.key,
      required this.constraints,
      required this.index,
      required this.filteredFood});

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  @override
  Widget build(BuildContext context) {
    debugPrint("product widget rebuild");
    final provider = Provider.of<FavoriteProvider>(context);
    final constraints = widget.constraints;
    final index = widget.index;
    final filteredFood = widget.filteredFood;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Column(children: [
              SizedBox(
                height: 6,
              ),
              Image.network(
                filteredFood[index].imgUrl,
                height: constraints.maxHeight * 0.4,
              ),
              Text(
                filteredFood[index].name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                filteredFood[index].category,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
              Text(
                '\$ ${filteredFood[index].price}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
            Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      final selectedFoodItem = products.firstWhere(
                          (item) => item.id == filteredFood[index].id);
                      final selectedFilteredFoodIndex =
                          products.indexOf(selectedFoodItem);
                      products[selectedFilteredFoodIndex] = filteredFood[index];
                      provider
                          .toggleFavorite(products[selectedFilteredFoodIndex]);
                    });
                  },
                  icon: Icon(
                    !provider.isExist(filteredFood[index])
                        ? Icons.favorite_border
                        : Icons.favorite,
                    color: Colors.deepOrange,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
