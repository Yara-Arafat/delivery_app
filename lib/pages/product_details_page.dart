import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/provider/favorite_provider.dart';
import 'package:food_delivery/widgets/product_details_property.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final FoodItem foodItem;
  const ProductDetailsPage({super.key, required this.foodItem});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int quantity = 1;

  void _increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decreaseQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final provider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          centerTitle: true,
          title: Text(
            widget.foodItem.name,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    final selectedFoodItem = products
                        .firstWhere((item) => item.id == widget.foodItem.id);
                    final selectedFilteredFoodIndex =
                        products.indexOf(selectedFoodItem);
                    //    products[selectedFilteredFoodIndex] = filteredFood[index];
                    provider
                        .toggleFavorite(products[selectedFilteredFoodIndex]);
                  });
                },
                icon: Icon(
                  !provider.isExist(widget.foodItem)
                      ? Icons.favorite_border
                      : Icons.favorite,
                  color: Colors.deepOrange,
                )),
            const SizedBox(
              width: 8,
            )
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Image.network(
                            widget.foodItem.imgUrl,
                            width: double.infinity,
                            height: 250,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 32.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.foodItem.name,
                                      style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      widget.foodItem.category,
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.black45),
                                    ),
                                  ],
                                ),
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  child: Row(
                                    children: [
                                      IconButton(
                                          onPressed: quantity > 1
                                              ? _decreaseQuantity
                                              : null,
                                          icon: const Icon(Icons.remove)),
                                      Text(quantity.toString()),
                                      IconButton(
                                          onPressed: _increaseQuantity,
                                          icon: const Icon(Icons.add))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 32.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ProductDetailsProperty(
                                    title: 'Size', value: widget.foodItem.size),
                                const SizedBox(
                                    height: 40, child: VerticalDivider()),
                                ProductDetailsProperty(
                                    title: 'Calories',
                                    value: '${widget.foodItem.calories} KCal'),
                                const SizedBox(
                                    height: 40, child: VerticalDivider()),
                                ProductDetailsProperty(
                                    title: 'Cooking',
                                    value: widget.foodItem.cookingTime),
                              ],
                            ),
                            const SizedBox(
                              height: 32.0,
                            ),
                            Text(
                              widget.foodItem.descrption,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black45),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        '\$ ${(widget.foodItem.price * quantity).toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.deepOrange),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: size.height * 0.05,
                        //width: size.width * 0.5,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepOrange,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0))),
                            child: const Text('Checkout')),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
