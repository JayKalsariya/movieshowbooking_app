import 'package:flutter/material.dart';
import 'package:movieshowbook_app/utils/data.dart';
import 'package:movieshowbook_app/view/screens/home_page.dart';

import '../../utils/routes.dart';

Widget movieCard({
  required Size size,
  required int index,
  required BuildContext context,
}) {
  Map<String, dynamic> movie = (ModalRoute.of(context)?.settings.arguments ??
      allMovies[0]) as Map<String, dynamic>;
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

  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          Routes.detailPage,
          arguments: allMovies[index],
        );
      },
      child: Container(
        height: size.height * 0.2,
        width: size.width * 1,
        decoration: BoxDecoration(
          color: const Color(0xffB99470),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  // height: size.height * 0.6,
                  // width: size.width * 0.35,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(
                        allMovies[index]['Poster'],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        allMovies[index]['Title'],
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        allMovies[index]['Released'],
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.access_time_filled,
                            color: Colors.white,
                          ),
                          Text(
                            allMovies[index]['Runtime'],
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.01),
                      Row(
                        children: [
                          Container(
                            height: size.height * 0.03,
                            // width: size.width * 0.2,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: Colors.white38,
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
                              color: Colors.white38,
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
