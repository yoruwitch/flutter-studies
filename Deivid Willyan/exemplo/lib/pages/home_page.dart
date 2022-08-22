import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();

  int indexBottomNav = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Evelyn'),
              accountEmail: Text('evelyn@email.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.black,
                child: Text('E'),
              ),
            ),
            ListTile(
              title: const Text('Item I'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                _pageController.jumpToPage(0);
                Navigator.pop(context);
                setState(() {
                  indexBottomNav = 0;
                });
              },
            ),
            ListTile(
              title: const Text('Item II'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                _pageController.jumpToPage(1);
                Navigator.pop(context);
                setState(() {
                  indexBottomNav = 1;
                });
              },
            ),
            ListTile(
              title: const Text('Item III'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                _pageController.jumpToPage(2);
                Navigator.pop(context);
                setState(() {
                  indexBottomNav = 2;
                });
              },
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          Column(
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.amberAccent,
                ),
                child: const Center(
                  child: const Text(
                    'Hello, world!',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    height: 100,
                    width: 200,
                    child: const Center(
                      child: Text(
                        'Container I',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: const Color.fromARGB(255, 139, 138, 139),
                    height: 100,
                    width: 200,
                    child: const Center(
                      child: Text(
                        'Container II',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Container(
            color: Colors.black12,
          ),
          Container(color: Colors.green)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 255, 208, 68),
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          selectedItemColor: Colors.white,
          onTap: (int index) {
            setState(() {
              indexBottomNav = index;
            });
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.decelerate);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.star_border_outlined),
              label: 'Item I',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_border_outlined),
              label: 'Item II',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_border_outlined),
              label: 'Item III',
            ),
          ]),
    );
  }
}
