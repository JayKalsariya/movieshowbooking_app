import 'package:flutter/material.dart';
import 'package:movieshowbook_app/utils/data.dart';

import '../components/movie_card.dart';

class ShowBook extends StatefulWidget {
  const ShowBook({super.key});

  @override
  State<ShowBook> createState() => _ShowBookState();
}

class _ShowBookState extends State<ShowBook> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffB99470),
        foregroundColor: Colors.white,
        title: const Text('Booked Show'),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ...favList.map(
                  (e) => Padding(
                    padding: const EdgeInsets.all(8.0),
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
//Image
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
                                      e['Poster'],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
//Data
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
//Title
                                    Text(
                                      e['Title'],
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
//Date
                                    Text(
                                      e['Released'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
//Time
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.access_time_filled,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          e['Runtime'],
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: size.height * 0.01),
//Genre
                                    Row(
                                      children: [
                                        Container(
                                          height: size.height * 0.03,
                                          // width: size.width * 0.2,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            color: Colors.white38,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            child: Text(
                                              e['Genre']
                                                  .toString()
                                                  .split(',')[0],
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: size.height * 0.01),
                                        Container(
                                          height: size.height * 0.03,
                                          // width: size.width * 0.2,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            color: Colors.white38,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            child: Text(
                                              e['Genre']
                                                  .toString()
                                                  .split(',')[1]
                                                  .split(',')[0],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: size.height * 0.02),
//Cancel
                                    GestureDetector(
                                      onTap: () {
                                        favList.remove(e);
                                        setState(() {});
                                      },
                                      child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                          height: size.height * 0.03,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            color: Colors.white38,
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8),
                                            child: Text('✖ Cancel'),
                                          ),
                                        ),
                                      ),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
