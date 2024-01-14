import 'package:flutter/material.dart';
import 'package:untitled/animations/FadeAnimation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        leading: Container(),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_basket,
                color: Colors.grey[800],
              ))
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeAnimation(
                    delay: 1,
                    child: Text(
                      'Food Delivery',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 20,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        FadeAnimation(
                          delay: 1,
                          child: makeCategory(isActive: true, title: 'Pizza'),
                        ),
                        FadeAnimation(
                          delay: 1.1,
                          child: makeCategory(isActive: false, title: 'Burger'),
                        ),
                        FadeAnimation(
                          delay: 1.2,
                          child: makeCategory(isActive: false, title: 'Kebab'),
                        ),
                        FadeAnimation(
                          delay: 1.3,
                          child: makeCategory(isActive: false, title: 'Salad'),
                        ),
                        FadeAnimation(
                          delay: 1.3,
                          child: makeCategory(isActive: true, title: 'Desert'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            FadeAnimation(
              delay: 1.1,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Free Delivery',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    FadeAnimation(
                      delay: 1,
                      child: makeItem(image: 'assets/images/starter.jpg'),
                    ),
                    FadeAnimation(
                      delay: 1.2,
                      child: makeItem(image: 'assets/images/kebab.jpg'),
                    ),
                    FadeAnimation(
                      delay: 1.3,
                      child: makeItem(image: 'assets/images/starter.jpg'),
                    ),
                    FadeAnimation(
                      delay: 1.4,
                      child: makeItem(image: 'assets/images/pizza.jpg'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget makeCategory({
    required bool isActive,
    required String title,
  }) {
    return AspectRatio(
      aspectRatio: isActive ? 7 : 3.5 / 1,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: isActive ? Colors.yellow[700] : Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Align(
          child: Text(
            title,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.grey[500],
              fontWeight: isActive ? FontWeight.bold : FontWeight.w100,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  Widget makeItem({required String image}) {
    return AspectRatio(
      aspectRatio: 1/1.5,
      child: GestureDetector(
        child: Container(
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              )),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                stops: const [0.2, 0.9],
                colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(0.3),
                ],
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\$15.00',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Vegetarian Pizaa',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,

                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
