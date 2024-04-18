import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/orders_coupons_widget.dart';
import 'package:food_delivery/widgets/profile_list_tile.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              CircleAvatar(
                radius:
                    size.width > 800 ? size.height * 0.2 : size.height * 0.1,
                backgroundImage: NetworkImage(
                    'https://static.photocdn.pt/images/articles/2019/08/07/images/articles/2019/07/31/best_linkedin_photos.webp'),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                'Ahmed Mohammed',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                'Software Engineer',
                style: TextStyle(fontSize: 18, color: Colors.black45),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OrdersCouponsWidget(title: 'Orders', value: 10),
                  SizedBox(
                    child: VerticalDivider(),
                    height: 45,
                  ),
                  OrdersCouponsWidget(title: 'Coupons', value: 5)
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Divider(
                indent: 20,
                endIndent: 20,
              ),
              ProfileListTile(
                  title: 'Orders', leadingIcon: Icons.shopping_cart_outlined),
              Divider(
                indent: 20,
                endIndent: 20,
              ),
              ProfileListTile(
                  title: 'Coupons', leadingIcon: Icons.card_giftcard_outlined),
              Divider(
                indent: 20,
                endIndent: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
