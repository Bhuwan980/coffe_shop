import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<String> coffeeNames = const [
    'All',
    'Espresso',
    'Americano',
    'Latte',
    'Cappuccino',
    'Mocha',
    'Macchiato',
    'Flat White',
    'Affogato',
    'Cortado',
    'Ristretto',
    'Turkish Coffee',
    'Irish Coffee',
    'Cold Brew',
    'Nitro Coffee',
    'Iced Coffee',
    'Pour Over'
  ];
  @override
  Widget build(BuildContext context) {
    // getting the width of the device
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.03),
          child: const CircleAvatar(
            backgroundImage: AssetImage('assets/images/sishu.jpg'),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.03),
            child: IconButton(
              //highlightColor: Colors.green,
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_outlined,
                size: 35,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // good evening text
            const Text(
              'Good Evening, Sishu',
              style: TextStyle(
                //fontFamily: 'OpenSans',
                //fontWeight: FontWeight.w500,
                fontSize: 25,
              ),
            ),
            // company name filter part
            SizedBox(
              height: 80,
              // margin: EdgeInsets.all(3),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: coffeeNames.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 9),
                      child: Chip(
                        backgroundColor:
                            const Color.fromARGB(255, 241, 248, 245),
                        padding: const EdgeInsets.all(9),
                        label: Text(coffeeNames[index]),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
