import 'package:flutter/material.dart';
import 'package:shoes_shop/favorite_page.dart';
import 'package:shoes_shop/main_page.dart';
import 'package:shoes_shop/notification_card.dart';
import 'package:shoes_shop/profile_page.dart';
import 'coffee_card.dart'; // Import the CoffeeCard widget

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  List<Widget> pages = const [MainPage(), FavoritePage(), ProfilePage()];

//slide up for notification icon
  void _showModalButtomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        color: const Color.fromARGB(255, 218, 223, 218),
        height: double.infinity,
        //width: double.infinity,
        child: SingleChildScrollView(
          child: Card(
            // padding: const EdgeInsets.all(15),
            //height: 30,
            // width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'assets/images/sishu.jpg',
                        height: 50,
                      )),
                  const Text('Hey soltee, Your Moccha Chai is ready\!'),
                  const Text("\$20")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.03),
          child: const CircleAvatar(
            backgroundImage: AssetImage('assets/images/bhuwan.jpeg'),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.03),
            child: IconButton(
              onPressed: () => _showModalButtomSheet(context),
              icon: const Icon(
                Icons.notifications_outlined,
                size: 35,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: IndexedStack(
        children: pages,
        index: currentPage,
      ),
      bottomNavigationBar: Builder(
        builder: (context) {
          final screenHight = MediaQuery.of(context).size.height;

          return SizedBox(
            height: screenHight * 0.118,
            //preferredSize: Size.fromHeight(35),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: (value) {
                print("$value, fucker mother");
                setState(() {
                  currentPage = value;
                });
              },
              currentIndex: currentPage,
              backgroundColor: const Color.fromARGB(255, 220, 236, 218),
              unselectedItemColor: const Color.fromARGB(255, 9, 9, 9),
              selectedItemColor: Theme.of(context).primaryColor,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    currentPage == 0 ? Icons.home : Icons.home_outlined,
                    size: 32,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                      currentPage == 1
                          ? Icons.favorite
                          : Icons.favorite_outline,
                      size: 32),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                      currentPage == 2
                          ? Icons.person_2
                          : Icons.person_2_outlined,
                      size: 32),
                  label: '',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
