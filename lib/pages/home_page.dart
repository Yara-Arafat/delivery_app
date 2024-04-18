import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_delivery/models/category_item.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/pages/product_details_page.dart';
import 'package:food_delivery/provider/favorite_provider.dart';
import 'package:food_delivery/widgets/product_item_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? selectedCategoryIndex;
  late List<FoodItem> filteredFood;

  @override
  void initState() {
    super.initState();
    filteredFood = products;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("home page rebuild");
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.menu),
                        )),
                  ),
                  const Column(
                    children: [
                      Text(
                        'Current location',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 20,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 6.0,
                          ),
                          Text(
                            'Tulkarm, Palestine',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.notifications),
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(
                  'https://marketplace.canva.com/EAFVfgsKMAE/1/0/1600w/canva-black-and-yellow-simple-minimalist-burger-promotion-banner-YTqWS2eL8TM.jpg',
                  height: size.width > 800
                      ? size.height * 0.45
                      : size.height * 0.22,
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search_rounded,
                    color: Colors.grey,
                  ),
                  hintText: 'Find your food ...',
                  hintStyle: const TextStyle(color: Colors.grey),
                  fillColor: Colors.white,
                  //   hoverColor: Colors.
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: size.width > 800
                    ? size.height * 0.2
                    : orientation == Orientation.landscape
                        ? size.height * 0.3
                        : size.height * 0.15,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (selectedCategoryIndex == null ||
                              selectedCategoryIndex != index) {
                            selectedCategoryIndex = index;
                          } else {
                            selectedCategoryIndex = null;
                            filteredFood = products;
                          }
                        });

                        if (selectedCategoryIndex != null) {
                          final selectedCategory =
                              categories[selectedCategoryIndex!];
                          filteredFood = products
                              .where((FoodItem) =>
                                  FoodItem.category == selectedCategory.name)
                              .toList();
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: index == selectedCategoryIndex
                                ? Colors.deepOrange
                                : Colors.white,
                            borderRadius: BorderRadius.circular(16.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Image.network(
                                categories[index].imgUrl,
                                height: 50,
                                width: 50,
                                color: index == selectedCategoryIndex
                                    ? Colors.white
                                    : null,
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                categories[index].name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: index == selectedCategoryIndex
                                      ? Colors.white
                                      : Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: size.width > 1100
                      ? 5
                      : size.width > 800
                          ? 4
                          : 2,
                  mainAxisSpacing: 18,
                  crossAxisSpacing: 18,
                ),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: filteredFood.length,
                itemBuilder: (context, index) =>
                    LayoutBuilder(builder: (context, constraints) {
                  return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductDetailsPage(
                                  foodItem: filteredFood[index],
                                )));
                      },
                      child: ProductItemWidget(
                          constraints: constraints,
                          index: index,
                          filteredFood: filteredFood));
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
