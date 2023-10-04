class CategoryItem {
  final String id;
  final String name;
  final String imgUrl;

  CategoryItem({
    required this.id,
    required this.name,
    required this.imgUrl,
  });
}

List<CategoryItem> categories = [
  CategoryItem(
      id: '1',
      name: 'Burger',
      imgUrl: 'https://cdn-icons-png.flaticon.com/512/1725/1725669.png'),
  CategoryItem(
      id: '2',
      name: 'Pizza',
      imgUrl: 'https://cdn-icons-png.flaticon.com/512/472/472096.png'),
  CategoryItem(
      id: '3',
      name: 'Pasta',
      imgUrl: 'https://cdn-icons-png.flaticon.com/512/4746/4746159.png'),
  CategoryItem(
      id: '4',
      name: 'Ckicken',
      imgUrl: 'https://cdn-icons-png.flaticon.com/512/5793/5793742.png'),
  CategoryItem(
      id: '5',
      name: 'Drinks',
      imgUrl: 'https://cdn-icons-png.flaticon.com/512/77/77403.png'),
];
