import 'package:flutter/material.dart';

class ModelBottomNav {
  final IconData iconNav;
  final String nameIconNav;

  ModelBottomNav({
    required this.iconNav,
    required this.nameIconNav,
  });
}

List<ModelBottomNav> listIconBtmNav = [
  ModelBottomNav(
    iconNav: Icons.home_outlined,
    nameIconNav: 'Home',
  ),
  ModelBottomNav(
    iconNav: Icons.person_outline,
    nameIconNav: 'Profile',
  ),
];
