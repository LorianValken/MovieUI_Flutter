import 'package:flutter/material.dart';
import 'package:movie_app/colors/constant.dart';
import 'package:movie_app/screens/downloading_view.dart';
import 'package:movie_app/screens/movie_detail.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  var activeIndex = 0;
  var lstFeatureMovies = [
     'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg',
     'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/qrwI2T844nrBUv3eDwQZRDdgSFs.jpg',
     'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/mmdBbXCs85JxxKyG664KI46rdC3.jpg',
     'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/1RaSkWakWBxxYOWRrqmwo2my5zg.jpg',
  ];

  var lstCategories = [
    'All',
    'Action',
    'Comedy',
    'Romance',
  ];

  var mostPopularMovies = [
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg',
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/qrwI2T844nrBUv3eDwQZRDdgSFs.jpg',
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/mmdBbXCs85JxxKyG664KI46rdC3.jpg',
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/1RaSkWakWBxxYOWRrqmwo2my5zg.jpg',
  ];

  var latestMovies = [
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg',
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/qrwI2T844nrBUv3eDwQZRDdgSFs.jpg',
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/mmdBbXCs85JxxKyG664KI46rdC3.jpg',
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/1RaSkWakWBxxYOWRrqmwo2my5zg.jpg',
  ];

  final pageContoller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body:  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PageView.builder(
                    controller: pageContoller,
                    itemCount: lstFeatureMovies.length,
                    itemBuilder: (context, index) {
                      final movie = lstFeatureMovies[index];
                      return Image.network(movie, fit: BoxFit.cover,
                      );
                    },
                  ),
                  Positioned(
                    bottom: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SmoothPageIndicator(
                              controller: pageContoller,  // PageController
                              count:  lstFeatureMovies.length,
                              effect:  const ExpandingDotsEffect(
                              activeDotColor: kButtonColor,
                              ),  // your preferred effect
                              onDotClicked: (index){}),
                        ],
                      ))
                ],
              ),
            ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Categories",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 40,
                      child: ListView.builder(
                        itemCount: lstCategories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final category = lstCategories[index];
                          return Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20)
                            ),
                            margin: const EdgeInsets.only(right: 10),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(category,style: const TextStyle(color: Colors.white)),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            //Most Popular
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 const Text(
                   "Most Popular",
                     style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 22,
                     color: Colors.white,
                   ),
                 ),
                 SizedBox(
                    height: 200,
                   child: ListView.builder(
                     scrollDirection: Axis.horizontal,
                      itemCount: mostPopularMovies.length,
                      itemBuilder: (context, index) {
                          final movie = mostPopularMovies[index];
                          return GestureDetector(
                             onTap: (){
                               Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailView(imageURL: movie,)));
                             },
                            //do action
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Image.network(movie),
                              ),
                            ),
                          );
                      },
                   ),
                 ),
                 const SizedBox(
                   height: 20,
                 ),
                 const Text(
                   "Latest Movies",
                   style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 22,
                     color: Colors.white,
                   ),
                 ),
                 SizedBox(
                   height: 200,
                   child: ListView.builder(
                     scrollDirection: Axis.horizontal,
                     itemCount: latestMovies.length,
                     itemBuilder: (context, index) {
                       final movie = latestMovies[index];
                       return Padding(
                         padding: const EdgeInsets.only(right: 15),
                         child: Padding(
                           padding: const EdgeInsets.only(top: 10),
                           child: Image.network(movie),
                         ),
                       );
                     },
                   ),
                 ),
               ],
             ),
           ),
          ],
        ),

      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kCardColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: activeIndex,
        onTap: (index){
          setState(() {
            activeIndex = index;
            if(index == 0){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeView(),));
            }else if(index == 2){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const DownloadingView(),));
            }
          });
        },
        type: BottomNavigationBarType.fixed,
        items:const [
          BottomNavigationBarItem(icon: Icon(SolarIconsOutline.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(SolarIconsOutline.magnifier),label: "Search"),
          BottomNavigationBarItem(icon: Icon(SolarIconsOutline.downloadMinimalistic),label: "Download"),
          BottomNavigationBarItem(icon: Icon(SolarIconsOutline.user),label: "Me"),
        ],
      ),
    );
  }
}
