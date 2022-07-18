import 'package:flutter/material.dart';
import 'package:slimy_card/slimy_card.dart';

class MyslimyCard extends StatefulWidget {
  const MyslimyCard({Key key}) : super(key: key);

  @override
  State<MyslimyCard> createState() => _MyslimyCardState();
}

class _MyslimyCardState extends State<MyslimyCard>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> _animation;
  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
      // reverseDuration: const Duration(seconds: 1),
    );

    _animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    );
    super.initState();
  }

  void repeatOnce() async {
    await controller.forward();
    // controller.stop();
    // await controller.reverse();
    repeatStop();
  }

  void repeatStop() async {
    // await controller.forward();
    controller.stop();
    // await controller.reverse();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: false,
        stream: slimyCard.stream,
        builder: ((context, snapshot) {
          print(snapshot.data);
          snapshot.data == true ? repeatOnce() : repeatStop();
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: ListView(
              children: [
                Center(
                  child: SlimyCard(
                    slimeEnabled: false,
                    color: Colors.blue,
                    topCardHeight: 200,
                    bottomCardHeight: 200,
                    topCardWidget: ((snapshot.data)
                        ? FadeTransition(
                            opacity: _animation, child: imageContainer())
                        : topcard()),
                    bottomCardWidget: bottomcard(),
                  ),
                )
              ],
            ),
          );
        }));
  }
}

Widget topcard() {
  return Column(
    children: [
      Container(
        height: 70,
        width: 70,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                blurRadius: 1,
              )
            ],
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/Indian-Breakfast.jpg"))),
      ),
      const Text(
        "Todays Menu",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 36, color: Colors.white),
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 10,
      )
    ],
  );
}

Widget bottomcard() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      itemtile("Breakfast", "Idli"),
      const Spacer(),
      itemtile("Lunch", "Meals"),
      const Spacer(),
      itemtile("Dinner", "Chappathi"),
    ],
  );
}

Widget mycontainer() {
  return Container(
    height: 70,
    width: 70,
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 210, 130, 72),
            blurRadius: 1,
          )
        ],
        image: DecorationImage(
            fit: BoxFit.contain,
            image: AssetImage("assets/Indian-Breakfast.jpg"))),
  );
}

Widget itemtile(String menu, String item) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.white),
        // color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(12),
        shape: BoxShape.rectangle),
    // width: 150,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              "$menu : $item",
              maxLines: 2,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
          const Spacer(),
          CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.5),
              child: const Icon(
                Icons.check,
                color: Colors.green,
              )),
          const Spacer(),
          CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.5),
              child: const Icon(Icons.close)),
        ],
      ),
    ),
  );
}

Widget imageContainer() {
  return AnimatedContainer(
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      boxShadow: [
        BoxShadow(
          blurRadius: 1,
        )
      ],
      image: DecorationImage(
          fit: BoxFit.cover, image: AssetImage("assets/Chinese-Cuisine.jpg")),
    ),
    curve: Curves.fastOutSlowIn,
    duration: const Duration(milliseconds: 40),
  );
}
