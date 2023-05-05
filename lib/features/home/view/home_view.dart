import 'package:carousel_slider/carousel_slider.dart';
import 'package:countries_world_map/countries_world_map.dart';
import 'package:flutter/material.dart';
import 'package:water_footprint/app/app_theme.dart';

import 'package:water_footprint/features/water_footprint/view/water_calculator_view.dart';

import '../../score/view/score_tracker.dart';
import '../widgets/widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late PageController _pageController;
  final int _currentPage = 0;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  List<String> initiatives = [
    'International Initiative on Water Quality (IIWQ)',
    'The United Nations Sustainable Development Goal 6: Clean Water and Sanitation',
    'The Water Footprint Network ',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const WaterCalculatorView(),
            ),
          );
        },
        child: const Icon(Icons.calculate_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: 80,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.water_drop_outlined,
                  size: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.leaderboard_outlined,
                  size: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_outlined,
                  size: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person_outline_outlined,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 250,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: AlignmentDirectional.topEnd,
                      end: Alignment(0.8, 0.9),
                      colors: [
                    kSecondaryColor,
                    ColorConstants.andromedaBlue,
                    Colors.white10
                  ])),
              child: SafeArea(
                child: FlexibleSpaceBar(
                  background: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 100,
                              height: 30,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                color: Colors.black26,
                              ),
                              child: const Center(
                                child: Text(
                                  'Your score',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.settings_outlined,
                                  size: 30,
                                ))
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16.0, 6.0, 16.0, 16.0),
                        child: ScoreTracker(),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                        child: Text(
                          'liters/day',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16.0, 6.0, 16.0, 16.0),
                        child: CustomSearchBar(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Initiatives',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.filter_list))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 170,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey[200],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'water conservation',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Icon(
                              Icons.remove_circle_outline,
                              size: 18,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 130,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey[200],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'clean water',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Icon(
                              Icons.remove_circle_outline,
                              size: 18,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                CarouselSlider(
                    items: initiatives.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Card(
                              child: SizedBox(
                            height: 500,
                            width: 500,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 15,
                                  left: 20,
                                  right: 20,
                                  child: SizedBox(
                                    height: 500,
                                    width: 500,
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        i,
                                        maxLines: 3,
                                        softWrap: true,
                                        style: const TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                                const Positioned(
                                    top: 70,
                                    left: 200,
                                    right: 20,
                                    child: SizedBox(
                                      height: 80,
                                      child: SimpleMap(
                                        instructions: SMapRomania.instructions,
                                      ),
                                    )),
                                Positioned(
                                  top: 40,
                                  bottom: 40,
                                  left: 30,
                                  child: SizedBox(
                                    width: 160,
                                    height: 30,
                                    child: Row(
                                      children: const [
                                        Icon(Icons.location_on),
                                        Text(
                                          'Bucharest, Romania',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 20,
                                  left: 30,
                                  child: Container(
                                    width: 100,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.grey[200],
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Icon(
                                          Icons.add_circle_outline,
                                          size: 18,
                                        ),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Text(
                                          'Join',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ));
                        },
                      );
                    }).toList(),
                    options: CarouselOptions(
                      reverse: false,
                      autoPlay: false,
                      enableInfiniteScroll: false,
                    )),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  child: Text(
                    'Upcoming meetups',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
