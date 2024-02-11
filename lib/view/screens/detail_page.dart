import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movieshowbook_app/utils/data.dart';

// import '../../utils/routes.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    Map<String, dynamic> movie = (ModalRoute.of(context)?.settings.arguments ??
        allMovies[0]) as Map<String, dynamic>;

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   leading: GestureDetector(
        //     onTap: () {
        //       Navigator.of(context).pop();
        //     },
        //     child: const Icon(Icons.first_page),
        //   ),
        //   backgroundColor: const Color(0xffB99470),
        //   foregroundColor: Colors.white,
        //   shape: const RoundedRectangleBorder(
        //     borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        //   ),
        //   centerTitle: true,
        // ),
        body: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: size.height * 0.35,
                    autoPlayInterval: const Duration(seconds: 2),
                    autoPlay: true,
                  ),
                  items: List.generate(
                    movie['Images'].length,
                    (index) => Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        // color: Colors.amber,
                        image: DecorationImage(
                          image: NetworkImage(movie['Images'][index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //title
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 0),
                        child: Text(
                          movie['Title'],
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      //imdb
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          SizedBox(width: size.height * 0.01),
                          Text(
                            movie['imdbRating'] + "  IMDb",
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.01),
                      //container
                      Row(
                        children: [
                          Container(
                            height: size.height * 0.03,
                            // width: size.width * 0.2,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: Color(0xffc8a37e),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                movie['Genre'].toString().split(',')[0],
                              ),
                            ),
                          ),
                          SizedBox(width: size.height * 0.01),
                          Container(
                            height: size.height * 0.03,
                            // width: size.width * 0.2,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: Color(0xffc8a37e),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                movie['Genre']
                                    .toString()
                                    .split(',')[1]
                                    .split(',')[0],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.01),
                      //data
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Duration    :  " + movie['Runtime'],
                          ),
                          Text(
                            "Language  :  " +
                                movie['Language'].toString().split(',')[0],
                          ),
                          Text(
                            "Rating        :  " + movie['Rated'],
                          ),
                          SizedBox(height: size.height * 0.01),
                          Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            movie['Plot'],
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.14),
                      GestureDetector(
                        onTap: () {
                          late SnackBar snackBar;
                          if (favList.contains(movie)) {
                            // favList.remove(movie);
                            snackBar = const SnackBar(
                              content: Text("Already Booked Your SHOW !!"),
                              backgroundColor: Colors.red,
                              behavior: SnackBarBehavior.floating,
                            );
                          } else {
                            favList.add(movie);
                            snackBar = const SnackBar(
                              content: Text("Book Your SHOW !!"),
                              backgroundColor: Colors.green,
                              behavior: SnackBarBehavior.floating,
                            );
                          }
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: Container(
                          height: size.height * 0.07,
                          decoration: BoxDecoration(
                            color: const Color(0xffc8a37e),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "Booking",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
