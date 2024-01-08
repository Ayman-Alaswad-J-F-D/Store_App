import 'package:flutter/material.dart';

const String baseUrlProduct = 'https://fakestoreapi.com';
const String baseUrlUsers = 'https://student.valuxapps.com/api';

//? For switching screen in drawer
int currentScreen = 0;
//? Token User
String? token;

widthScreen(context) => MediaQuery.of(context).size.width;
heightScreen(context) => MediaQuery.of(context).size.height;
