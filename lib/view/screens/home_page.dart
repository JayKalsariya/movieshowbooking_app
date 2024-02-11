import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieshowbook_app/view/components/movie_card.dart';

import '../../utils/data.dart';
import '../../utils/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> carouselImg = [
    "https://rukminim2.flixcart.com/image/850/1000/kt0enww0/poster/o/l/2/medium-amazing-avatar-hd-movie-matte-finish-poster-original-imag6ghshumrqjrs.jpeg?q=90&crop=false",
    "https://s29288.pcdn.co/wp-content/uploads/2020/08/i-am-legend-image-750.jpg",
    "https://rukminim2.flixcart.com/image/850/1000/knunf680/poster/d/r/b/medium-300-movie-movie-wall-poster-for-room-with-gloss-original-imag2g3a6xfxsnvz.jpeg?q=90&crop=false",
    "https://i.pinimg.com/736x/a3/77/e7/a377e72a833f88a48089489ea5acddc0.jpg",
    "https://www.vintagemovieposters.co.uk/wp-content/uploads/2019/12/IMG_2359.jpeg",
  ];
  String? selectedGenre;
  List<String> genre = [];
  List<Map<String, dynamic>> selectGenre = [];

  @override
  void initState() {
    genre = allMovies
        .map((e) => e['Genre'].toString().split(',')[0])
        .toSet()
        .toList();
    List category = allMovies.map((e) {
      String genre = e['Genre'];

      List<String> allGenre = genre.split(', ');
      String g1 = allGenre[0];
      String g2 = allGenre[1];
      String g3 = allGenre[2];
      // String cat3 = genre.split(',')[1].split(',')[1];
      // log(g1);
      // log(g2);
      // log(g3);
    }).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffB99470),
        foregroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        centerTitle: true,
        title: const Text(
          "FilmKu",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    Routes.showBookingPage,
                  );
                },
                icon: Icon(CupertinoIcons.tickets_fill)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
//popular
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Popular',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.001,
                  ),
                  Container(
                    height: size.height * 0.27,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Color(0xffc8a37e),
                    ),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        // reverse: true,
                        height: size.height * 0.25,
                        autoPlayInterval: const Duration(milliseconds: 1500),
                        enableInfiniteScroll: true,
                        scrollPhysics: const BouncingScrollPhysics(),
                        enlargeCenterPage: true,
                      ),
                      items: carouselImg.map(
                        (i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade800,
                                        offset: Offset(7, 7),
                                        blurRadius: 5,
                                        blurStyle: BlurStyle.normal,
                                      ),
                                    ],
                                    image: DecorationImage(
                                      image: NetworkImage(i),
                                      fit: BoxFit.cover,
                                    ),
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ).toList(),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.040,
              ),
//genre
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
//genre
                  Text(
                    'Genre',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        //All
                        GestureDetector(
                          onTap: () {
                            selectedGenre = null;
                            setState(() {});
                          },
                          child: Container(
                            height: 40,
                            // width: 100,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 5,
                            ),
                            margin: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10),
                              color: selectedGenre == null
                                  ? const Color(0xffB99470)
                                  : Colors.grey.shade100,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 3,
                                  offset: Offset(3.0, 3.0),
                                  // spreadRadius: 1,
                                ),
                              ],
                              border: Border.all(
                                width: 1,
                                color: Colors.black,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "All",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: selectedGenre == null
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        ...List.generate(
                          genre.length,
                          (index) => GestureDetector(
                            onTap: () {
                              selectedGenre = genre[index];
                              selectGenre = allMovies
                                  .where((element) =>
                                      element['Genre']
                                          .toString()
                                          .split(',')[0] ==
                                      selectedGenre)
                                  .toList();
                              setState(() {});
                            },
                            child: Container(
                              height: 40,
                              // width: 100,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 5,
                              ),
                              margin: const EdgeInsets.all(7),
// container decoration
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10),
                                color: selectedGenre == genre[index]
                                    ? const Color(0xffc8a37e)
                                    : Colors.grey.shade100,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 3,
                                    offset: Offset(3.0, 3.0),
                                    // spreadRadius: 1,
                                  ),
                                ],
                                border: Border.all(
                                    width: 1,
                                    color: Colors.black,
                                    ),
                              ),
// container in category text
                              child: Center(
                                child: Text(
                                  genre[index],
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: selectedGenre == genre[index]
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
//movies
              SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    selectedGenre != null
                        ? selectGenre.length
                        : allMovies.length,
                    (index) => movieCard(
                      size: size,
                      index: selectedGenre != null
                          ? allMovies.indexOf(selectGenre[index])
                          : index,
                      context: context,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
