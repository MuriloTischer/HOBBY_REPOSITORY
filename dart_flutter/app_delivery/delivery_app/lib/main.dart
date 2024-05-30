import 'package:delivery_app/app/core/config/env/env.dart';
import 'package:delivery_app/delivery_app.dart';
import 'package:flutter/material.dart';

void main() async{
 await Env.i.load();
  runApp(const DeliveryApp());
}

