class FoodItem {
  final String id;
  final String name;
  final String imgUrl;
  final double price;

  final int numberOfSales;
  final String category;
  final bool isFavorite;
  final int calories;
  final String cookingTime;
  final String size;
  final String descrption;

  FoodItem(
      {required this.id,
      required this.name,
      required this.imgUrl,
      required this.price,
      required this.category,
      required this.calories,
      required this.cookingTime,
      required this.size,
      this.numberOfSales = 2,
      this.isFavorite = false,
      this.descrption =
          'Lorem Ipsom Lorem Ipsom Lorem Ipsom Lorem Ipsom Lorem Ipsom Lorem Ipsom Lorem Ipsom Lorem Ipsom Lorem Ipsom Lorem Ipsom Lorem Ipsom Lorem Ipsom Lorem Ipsom Lorem Ipsom Lorem Ipsom Lorem Ipsom Lorem Ipsom Lorem Ipsom Lorem Ipsom Lorem Ipsom Lorem Ipsom Lorem Ipsom Lorem Ipsom Lorem Ipsom Lorem Ipsom Lorem Ipsom Lorem Ipsom Lorem Ipsom Lorem Ipsom Lorem Ipsom Lorem Ipsom Lorem Ipsom Lorem Ipsom Lorem Ipsom Lorem Ipsom '});

  FoodItem copyWith({bool? isFavorite}) {
    return FoodItem(
      id: id,
      name: name,
      imgUrl: imgUrl,
      price: price,
      category: category,
      calories: calories,
      size: size,
      cookingTime: cookingTime,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

List<FoodItem> products = [
  FoodItem(
      id: '1',
      name: 'Beef Burger',
      imgUrl:
          'https://static.vecteezy.com/system/resources/previews/022/598/811/original/tasty-beef-burger-png.png',
      price: 6.99,
      category: 'Burger',
      cookingTime: '30 Mins',
      size: 'Medium',
      calories: 350),
  FoodItem(
      id: '2',
      name: 'Chicken Burger',
      imgUrl:
          'https://www.hungryjacks.com.au/Upload/HJ/Media/UNO/HJ00571_WEB_Jack%CE%93COs-Fried-Chicken-classic_800X600_3.png',
      price: 5.99,
      category: 'Burger',
      cookingTime: '30 Mins',
      size: 'Medium',
      calories: 350),
  FoodItem(
      id: '3',
      name: 'Pizza salami',
      imgUrl: 'https://www.pngmart.com/files/1/Pepperoni-Pizza-PNG-Image.png',
      price: 8.99,
      category: 'Pizza',
      cookingTime: '20 Mins',
      size: 'Large',
      calories: 400),
  FoodItem(
      id: '4',
      name: 'Pizza margherita',
      imgUrl:
          'https://upload.wikimedia.org/wikipedia/commons/e/ee/Eq_it-na_pizza-margherita_sep2005_sml-2.png',
      price: 8.99,
      category: 'Pizza',
      cookingTime: '20 Mins',
      size: 'Large',
      calories: 350),
  FoodItem(
      id: '5',
      name: 'Dominos pizza',
      imgUrl:
          'https://www.pngall.com/wp-content/uploads/4/Pepperoni-Dominos-Pizza-PNG-HD-Image.png',
      price: 7.99,
      category: 'Pizza',
      cookingTime: '20 Mins',
      size: 'Large',
      calories: 450),
  FoodItem(
      id: '6',
      name: 'Lasagna pasta',
      imgUrl:
          'https://static.vecteezy.com/system/resources/previews/026/773/406/original/lasagna-with-ai-generated-free-png.png',
      price: 9.99,
      category: 'Pasta',
      cookingTime: '35 Mins',
      size: 'Medium',
      calories: 550),
  FoodItem(
      id: '7',
      name: 'Fettuccine pasta',
      imgUrl:
          'https://www.michelinas.com/wp-content/uploads/2017/09/10521_FetAlfChicBro-1024x478.png',
      price: 7.99,
      category: 'Pasta',
      cookingTime: '25 Mins',
      size: 'Medium',
      calories: 250),
  FoodItem(
      id: '8',
      name: 'Fried chicken',
      imgUrl:
          'https://pngimg.com/uploads/fried_chicken/fried_chicken_PNG14094.png',
      price: 6.99,
      category: 'Chicken',
      cookingTime: '30 Mins',
      size: 'Medium',
      calories: 350),
  FoodItem(
      id: '9',
      name: 'grilled chicken',
      imgUrl:
          'https://static.vecteezy.com/system/resources/previews/021/665/576/original/delicious-grilled-chicken-cutout-png.png',
      price: 7.99,
      category: 'Chicken',
      cookingTime: '30 Mins',
      size: 'Medium',
      calories: 350),
  FoodItem(
      id: '10',
      name: 'Coca cola',
      imgUrl:
          'https://e7.pngegg.com/pngimages/742/816/png-clipart-coke-coke-drink-thumbnail.png',
      price: 0.99,
      category: 'Drinks',
      cookingTime: '5 Mins',
      size: 'Small',
      calories: 350),
  FoodItem(
      id: '11',
      name: 'Pepsi',
      imgUrl:
          'https://i.pinimg.com/originals/3d/c5/4e/3dc54e8f5df2eaa53ca93758d080b2f0.png',
      price: 0.99,
      category: 'Drinks',
      cookingTime: '5 Mins',
      size: 'Small',
      calories: 350),
];
