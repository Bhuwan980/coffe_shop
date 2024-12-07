import 'package:flutter/material.dart';
import 'package:shoes_shop/coffee_card.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final Color creamColor = const Color.fromARGB(255, 241, 248, 245);
  int  currentPage = 0;

  

  late String selectedFilter;
  
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
  void initState() {
    super.initState();
    selectedFilter = coffeeNames[0];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Good evening, Bhuwan Bro',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30, top: 10, bottom: 10, right: 30),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 30,
                    ),
                    suffixIcon: const Icon(Icons.tune),
                    hintText: 'Search',
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cera',
                      fontSize: 18,
                      color: Color.fromARGB(255, 123, 120, 120),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                    filled: true,
                    fillColor: creamColor,
                  ),
                ),
              ),
              const Text(
                'Categories',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: coffeeNames.length,
                    itemBuilder: (context, index) {
                      String filter = coffeeNames[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 9),
                        child: GestureDetector(
                          onTap: () {
                            if (mounted) {
                              setState(() {
                                selectedFilter = filter;
                              });
                            }
                          },
                          child: Chip(
                            avatar: Icon(
                              Icons.coffee,
                              color: selectedFilter == filter
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            backgroundColor: selectedFilter == filter
                                ? Theme.of(context).colorScheme.primary
                                : creamColor,
                            labelStyle: TextStyle(
                                color: selectedFilter == filter
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold),
                            padding: const EdgeInsets.all(9),
                            label: Text(
                              coffeeNames[index],
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)),
                          ),
                        ),
                      );
                    }),
              ),
              // Coffee card list (based on selected filter)
              Container(
                padding: const EdgeInsets.all(10),
                height: 275,
                child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      19, // You may update this based on the filtered list
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CoffeeCard(coffeeTitle: selectedFilter),
                    );
                  },
                ),
              ),

              // special offer section
              const Text(
                'Special Offer 🔥',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),

              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20)),
                      child: Image.asset(
                        'assets/images/bhuwan.jpeg',
                        height: 140,
                      ),
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Center(
                            child: Text(
                              'Grab it now! Its an offer \n with chocolate and matte.',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}