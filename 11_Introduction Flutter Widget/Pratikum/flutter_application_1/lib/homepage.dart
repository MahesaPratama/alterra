import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//Buatkan saya UI Testing dalam flutter berdasarkan  code dibawah ini
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget foodCategory(String pic, String txt) {
    return Column(
      children: [
        Image.asset(pic, height: 100, width: 100),
        Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(txt,
                style:
                    whiteTextColor.copyWith(fontWeight: medium, fontSize: 15)))
      ],
    );
  }

  Widget foodMenu(String pic, String menu, String price) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      height: 300,
      width: 195,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.amber,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(pic, height: 150, width: 150),
          Text(
            menu,
            style: whiteTextColor.copyWith(fontWeight: extraBold, fontSize: 20),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(price,
                    style: whiteTextColor.copyWith(
                        fontWeight: bold, fontSize: 15)),
                const Icon(
                  FontAwesomeIcons.plus,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.amber),
        backgroundColor: Colors.amber,
        elevation: 0,
        leading: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Image.asset('assets/Akun.png', height: 80, width: 80)),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hi, Mahesa',
                style: whiteTextColor.copyWith(fontWeight: bold, fontSize: 12)),
            Text('Lets grab your food',
                style: whiteTextColor.copyWith(fontWeight: bold, fontSize: 10)),
          ],
        ),
        actions: const [
          Padding(
              padding: EdgeInsets.only(right: 10),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  FontAwesomeIcons.bell,
                  color: Colors.amber,
                  size: 20,
                ),
              ))
        ],
        toolbarHeight: 80,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Food Category',
                      style: blackTextColor.copyWith(fontWeight: extraBold),
                    ),
                    TextButton(
                        onPressed: null,
                        child: Text(
                          'See more',
                          style: orangeTextColor.copyWith(fontWeight: bold),
                        ))
                  ],
                )),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.amber),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    foodCategory('assets/Burger.png', 'Burger'),
                    foodCategory('assets/Donat.png', 'Donat'),
                    foodCategory('assets/Hotdog.png', 'Hotdog'),
                    foodCategory('assets/Pizza.png', 'Pizza'),
                    foodCategory('assets/Burger.png', 'Burger'),
                    foodCategory('assets/Donat.png', 'Donat'),
                    foodCategory('assets/Hotdog.png', 'Hotdog'),
                    foodCategory('assets/Pizza.png', 'Pizza'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Food For You',
                      style: blackTextColor.copyWith(fontWeight: extraBold)),
                  const Icon(FontAwesomeIcons.ellipsis)
                ],
              ),
            ),
            Wrap(
              children: [
                foodMenu('assets/Alpukat.png', 'Avocado and Egg Toast', '\$12.30'),
                foodMenu('assets/Salad.png', 'Mix Salad with beans', '\$10.40'),
                foodMenu('assets/Chicken.png', 'Chicken Salad', '\$9.50'),
                foodMenu('assets/Energy.png', 'Energy Power Bowl', '\$8.30'),
                foodMenu('assets/Alpukat.png', 'Avocado and Egg Toast', '\$12.30'),
                foodMenu('assets/Salad.png', 'Mix Salad with beans', '\$10.40'),
                foodMenu('assets/Chicken.png', 'Chicken Salad', '\$9.50'),
                foodMenu('assets/Energy.png', 'Energy Power Bowl', '\$8.30'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
