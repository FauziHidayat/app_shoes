import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_shoes/models/shoes_model.dart';
import 'package:app_shoes/models/cart_model.dart';

const Color blue = Color(0xFF148BFF);
const Color red = Color(0xFFC3011B);
const Color white = Color(0xFFDCDBEB);

List<ShoesModel> sportshoeslist = [
  ShoesModel(
    name: 'Nike Shoes',
    img: 'images/sportshoes.png',
    company: 'Nike',
    price: 123,
    isselected: false,
    color: red,
  ),
  ShoesModel(
    name: 'Nike Shoes',
    img: 'images/nikeshoes.png',
    company: 'Nike',
    price: 103,
    isselected: false,
    color: Colors.amber.shade700,
  ),
  ShoesModel(
    name: 'Nike Shoes',
    img: 'images/nikesport.png',
    company: 'Nike',
    price: 100,
    isselected: false,
    color: blue,
  ),
];


List<ShoesModel> menshoeslist = [
  ShoesModel(
    name: 'Mowdy Shoes',
    img: 'images/blackshoes.png',
    company: 'Mowdy',
    price: 223,
    isselected: false,
    color: Colors.teal
  ), ShoesModel(
    name: 'Rido Shoes',
    img: 'images/menshoes.png',
    company: 'Rido',
    price: 299,
    isselected: false,
    color: Colors.amber.shade700
  ),
  ShoesModel(
      name: 'Sunny Shoes',
      img: 'images/redshoes.png',
      company: 'Sunny',
      price: 109,
      isselected: false,
      color: blue),
];

List<ShoesModel> womenshoeslist = [
  ShoesModel(
    name: 'Caty Shoes',
    img: 'images/femaleshoes.png',
    company: 'Caty',
    price: 449,
    isselected: false,
    color: Colors.amber.shade700
  ),
  ShoesModel(
      name: 'Heelmy Shoes',
      img: 'images/heelshoes.png',
      company: 'Heelmy',
      price: 500,
      isselected: false,
      color: Colors.blue
  ),
  ShoesModel(
      name: 'Pinky Shoes',
      img: 'images/pinkshoes.png',
      company: 'Pinky',
      price: 553,
      isselected: false,
      color: Colors.red
  ),

];

List<ShoesModel> allshoes = sportshoeslist + menshoeslist + womenshoeslist;

List sizes = [40, 41, 42, 43, 44];

List<CartModel> boughtitems = [];
List<ShoesModel> favoriteitems = [];

double total = 0.00;