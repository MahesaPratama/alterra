import 'package:flutter/material.dart';
import 'package:flutter_application_1/Page/movie_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color darkRed = const Color(0xff6D071A);
  final Map movieContent = {
    'Terrfier 2': {
      'Image':
          'https://static.tvtropes.org/pmwiki/pub/images/3d4c6774_f517_494f_8ae7_668d30b80763.jpeg',
      'Description':
          'After being resurrected by a sinister entity, Art the Clown returns to the timid town of Miles County where he targets a teenage girl and her younger brother on Halloween night.',
      'Trailer': 'https://youtu.be/6KkONLf_ZKU?t=2',
      'Year': '2022',
      'Age': '18+',
      'Time': '2h 18m'
    },
    'Joker': {
      'Image':
          'https://hips.hearstapps.com/hmg-prod/images/img-2167-2-1596042163.jpeg?crop=1xw:0.6632302405498282xh;center,top&resize=980:*',
      'Description':
          'The rise of Arthur Fleck, from aspiring stand-up comedian and pariah to Gotham\'s clown prince and leader of the revolution.',
      'Trailer': 'https://youtu.be/zAGVQLHvwOY',
      'Year': '2019',
      'Age': '17+',
      'Time': '2h 2m'
    },
    'Annabelle': {
      'Image':
          'https://i.pinimg.com/564x/1e/d5/71/1ed571b10b3becccf188bea40abef907.jpg',
      'Description':
          'While babysitting the daughter of Ed and Lorraine Warren, a teenager and her friend unknowingly awaken an evil spirit trapped in a doll.',
      'Trailer': 'https://youtu.be/bCxm7cTpBAs',
      'Year': '2014',
      'Age': 'R',
      'Time': '1h 39m'
    },
    'Get Out': {
      'Image':
          'https://i.pinimg.com/564x/5e/bd/e0/5ebde0ecadeefb50686ca15673a88861.jpg',
      'Description':
          'A young African-American visits his White girlfriend\'s parents for the weekend, where his simmering uneasiness about their reception of him eventually reaches a boiling point',
      'Trailer': 'https://youtu.be/DzfpyUB60YY',
      'Year': '2017',
      'Age': '17+',
      'Time': '1h 44m'
    },
    'Us': {
      'Image':
          'https://hips.hearstapps.com/hmg-prod/images/716riayrvwl-ac-sl1500-1595956613.jpg?crop=1.00xw:0.633xh;0,0.101xh&resize=980:*',
      'Description':
          'A family\'s serene beach vacation turns to chaos when their doppelgängers appear and begin to terrorize them',
      'Trailer': 'https://youtu.be/hNCmb-4oXJA',
      'Year': '2019',
      'Age': '17+',
      'Time': '1h 56m'
    },
    'The Silence of the Lambs': {
      'Image':
          'https://hips.hearstapps.com/hmg-prod/images/81svdo6wcrl-ac-sl1500-1595954187.jpg?crop=1xw:0.6753333333333333xh;center,top&resize=980:*',
      'Description':
          'A young F.B.I. cadet must receive the help of an incarcerated and manipulative cannibal killer to help catch another serial killer, a madman who skins his victims.',
      'Trailer': 'https://youtu.be/W6Mm8Sbe__o',
      'Year': '1991',
      'Age': 'D',
      'Time': '1h 58m'
    },
    'The Platform': {
      'Image':
          'https://i.pinimg.com/564x/bb/06/83/bb0683bca41055875a456851f6d99422.jpg',
      'Description':
          'A vertical prison with one cell per level. Two people per cell. Only one food platform and two minutes per day to feed. An endless nightmare trapped in The Hole.',
      'Trailer': 'https://youtu.be/RlfooqeZcdY',
      'Year': '2019',
      'Age': '18+',
      'Time': '1h 34m'
    },
    'Split': {
      'Image':
          'https://mir-s3-cdn-cf.behance.net/project_modules/1400/e635aa51322935.58ea1e939eaf1.jpg',
      'Description':
          'Three girls are kidnapped by a man with a diagnosed 23 distinct personalities. They must try to escape before the apparent emergence of a frightful new 24th.',
      'Trailer': 'https://youtu.be/84TouqfIsiI',
      'Year': '2016',
      'Age': '17+',
      'Time': '1h 57m'
    },
  };

  void movieDetail(String keys) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetailPage(
          imageUrl: movieContent[keys]['Image'],
          movieTitle: keys,
          movieDescription: movieContent[keys]['Description'],
          movieTrailer: movieContent[keys]['Trailer'],
          age: movieContent[keys]['Age'],
          time: movieContent[keys]['Time'],
          year: movieContent[keys]['Year'],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: listFilm(),
        ),);
  }

  Widget listFilm() {
    final movieList = movieContent.entries.toList();
    return GridView.builder(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      itemCount: movieContent.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 15,
      ),
      itemBuilder: (BuildContext context, index) {
        return GestureDetector(
          onTap: () {
            showBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: darkRed,
                              content: Image(
                                  image: NetworkImage(
                                      movieContent[movieList[index].key]
                                          ['Image'])),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                ElevatedButton(
                                    onPressed: () =>
                                        movieDetail(movieList[index].key),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                    ),
                                    child: Text(
                                      ' Watch Trailer',
                                      style: TextStyle(
                                          color: darkRed,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            );
                          });
                    },
                    child: Container(
                      color: Colors.black,
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      height: 290,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image(
                                image: NetworkImage(
                                    movieContent[movieList[index].key]
                                        ['Image']),
                                fit: BoxFit.fill,
                                width: 150,
                                height: 200,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: SizedBox(
                                  width: 220,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(movieList[index].key,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Text(
                                            movieContent[movieList[index].key]
                                                ['Year'],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Text(
                                              movieContent[movieList[index].key]
                                                  ['Age'],
                                            ),
                                          ),
                                          Text(
                                            movieContent[movieList[index].key]
                                                ['Time'],
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 15),
                                      Text(
                                        movieContent[movieList[index].key]
                                            ['Description'],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            decoration: const BoxDecoration(
                                border: Border(
                                    top: BorderSide(color: Colors.grey))),
                            child: const ListTile(
                              leading: Icon(Icons.info_outline),
                              title: Text(
                                'Rincian & Lainnya',
                              ),
                              trailing: Icon(
                                Icons.arrow_forward,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
          child: Column(
            children: [
              Container(
                height: 150,
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(
                        movieContent[movieList[index].key]['Image']),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                movieList[index].key,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
