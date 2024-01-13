import 'package:flutter/material.dart';

class homeModel{
  final String? image;
  final Icon? icon;
  final String title;
  final String body;



  homeModel({
     this.image,
     this.icon,
    required this.title,
    required this.body,

  });
}