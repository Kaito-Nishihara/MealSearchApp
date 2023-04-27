import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealsearchapp/model/grid_image_data.dart';
import 'package:mealsearchapp/model/restaurant_seach.dart';

import '../widgets/cards_stack_widget.dart';

class Result extends StatefulWidget {
  RestaurantSeach restaurantSeach;
  Result(this.restaurantSeach, {super.key});

  @override
  State<Result> createState() => _Result();
}

class _Result extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "",
      home: Scaffold(
        appBar: AppBar(title: const Text("")),
        body: const MyStatelessWidget(),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.red.shade200, Colors.black]),
        ),
        child: Scaffold(
          body: Stack(
            children: const [
              CardsStackWidget(),
            ],
          ),
        ),
      );
}
