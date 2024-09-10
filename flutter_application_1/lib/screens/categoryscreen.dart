import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/dummy_data%20(1).dart';
import 'package:flutter_application_1/models/meal.dart';
import 'package:flutter_application_1/widgets/grid_item.dart';

class categoryscreen extends StatefulWidget {
  const categoryscreen({
    Key? key,
    required this.available,
  }) : super(key: key);

  final List<Meal> available;

  @override
  State<categoryscreen> createState() => _categoryscreenState();
}

class _categoryscreenState extends State<categoryscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 1),
        lowerBound: 0,
        upperBound: 1);
    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image(fit: BoxFit.cover,
          image: NetworkImage(
              'https://images.squarespace-cdn.com/content/v1/58dd75f229687f5a850ec676/4da6896d-061c-4029-9457-02701e6049ed/how-much-does-a-food-photographer-make.jpg?format=750w'),
          height: double.infinity,
          width: double.maxFinite),
      AnimatedBuilder(
          child: GridView(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
              children: [
                for (final x in availableCategories)
                  item(
                    category: x,
                    available: widget.available,
                  )
              ]),
          animation: controller,
          builder: (ctx, child) => Padding(
                padding: EdgeInsets.only(top: 140 - controller.value * 140),
                child: child,
              )),
    ]);
  }
}
