import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class Constants {

  static const String dashboardScreen = '/dashboard_Screen';
  static const String itemDetailPage = '/item_Detail_Page';
  static const String selectedCartItemPage = '/selected_Cart_Item_Page';

  // static final LocalStorage storage = LocalStorage('fav');

  static Color appRedColor = const Color(0xFFFF5001);
  static Color? appBarColor = Colors.grey[200];

  static const List dataList = [
    {
      "name":"Asia Pacific",
      "img":"assets/images/asia_pacific.jpeg",
      "price":"0.70"
    },
    {
      "name":"BBM Magazine",
      "img":"assets/images/bbm_magazine.jpeg",
      "price":"0.60"
    },
    {
      "name":"Cakes",
      "img":"assets/images/cakes.jpeg",
      "price":"0.40"
    },
    {
      "name":"Crossfire",
      "img":"assets/images/crossfire.jpeg",
      "price":"0.20"
    },
    {
      "name":"Design Tips",
      "img":"assets/images/design_tips.jpeg",
      "price":"0.80"
    },
    {
      "name":"Dil Pasand",
      "img":"assets/images/dilpasand.jpeg",
      "price":"0.50"
    },
    {
      "name":"Feed Ipedia",
      "img":"assets/images/feedipedia.jpeg",
      "price":"0.90"
    },
    {
      "name":"GST",
      "img":"assets/images/gst.jpeg",
      "price":"0.10"
    },
    {
      "name":"Pastry",
      "img":"assets/images/pastry.jpeg",
      "price":"0.30"
    }
  ];
}
