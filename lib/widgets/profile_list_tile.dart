import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  const ProfileListTile(
      {super.key, required this.title, required this.leadingIcon});

  @override
  Widget build(BuildContext context) {
    return listItem();
  }

  Widget listItem() {
    return Platform.isIOS
        ? CupertinoListTile(
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            onTap: () {},
            leading: Icon(
              leadingIcon,
              size: 30,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
          )
        : ListTile(
            onTap: () {},
            leading: Icon(
              leadingIcon,
              size: 30,
            ),
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
          );
  }
}
