import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_application_1/models/meal.dart';

class mealitem extends StatelessWidget {
  const mealitem({
    Key? key,
    required this.meal,
    required this.onselected,
  }) : super(key: key);
  final Meal meal;

  final void Function(Meal meal) onselected;

  String get complexity {
    switch (meal.complexity) {
      case Complexity.simple:
        return 'simple';

      case Complexity.hard:
        return 'hard';

      case Complexity.challenging:
        return 'challengimg';

      default:
        return 'unknown';
    }
  }

  String get affordability {
    switch (meal.affordability) {
      case Affordability.affordable:
        return 'affordable';

      case Affordability.luxurious:
        return 'luxurious';

      case Affordability.pricey:
        return 'pricey';

      default:
        return 'unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    final e = meal.duration;

    return InkWell(
      onTap: () => onselected(meal),
      child: Card(
        elevation: 40,
       margin: const EdgeInsets.all(19),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            Stack(
              children: [
              
                Hero(
                  tag: meal.id,
                  child: FadeInImage(
                      placeholder: MemoryImage(kTransparentImage),
                      image: NetworkImage(meal.imageUrl)),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 44),
                    color: Colors.black45,
                    child: Container(
                      width: 220,
                      child: Column(
                        children: [
                          Text(
                            meal.title,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.w100),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(
                        width: 5,
                      ),
                      Text("$e min")
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(
                        width: 5,
                      ),
                      Text("$complexity ")
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      Text("$affordability")
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
