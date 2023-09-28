
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/review.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_application_1/Model/store.dart' as review_store;

class MovieDetailPage extends StatefulWidget {
  final String imageUrl;
  final String movieTitle;
  final String movieDescription;
  final String movieTrailer;
  final String age;
  final String time;
  final String year;

  const MovieDetailPage(
      {Key? key,
      required this.imageUrl,
      required this.movieTitle,
      required this.movieDescription,
      required this.movieTrailer,
      required this.age,
      required this.time,
      required this.year})
      : super(key: key);

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  late YoutubePlayerController _controller;
  String name = '';
  String review = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController reviewController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final url = widget.movieTrailer;
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        loop: false,
      ),
    );
  }

  @override
  void deactivate() {
    super.deactivate();
    _controller.pause();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    reviewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<review_store.Review>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.black,
        title: const Text('Movie Trailer & Review',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: YoutubePlayer(
                      controller: _controller,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      txt(
                        widget.movieTitle,
                        fontWeight: FontWeight.bold,
                        txtsize: 30,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: 250,
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.white)),
                              child: txt(widget.year),
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: txt(widget.age)),
                            txt(widget.time)
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Column(
                            children: [
                              Icon(Icons.download),
                              Text('Download')
                            ],
                          ),
                          SizedBox(
                            width: 200,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red),
                                onPressed: () {
                                  setState(() {
                                    if (_controller.value.isPlaying) {
                                      _controller.pause();
                                    } else {
                                      _controller.play();
                                    }
                                  });
                                },
                                child: _controller.value.isPlaying
                                    ? const Text('Play Now')
                                    : const Text('Stop')),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: txt(widget.movieDescription),
                      ),
                      const SizedBox(height: 15),
                      Align(
                          child: txt('Review',
                              fontWeight: FontWeight.bold, txtsize: 20)),
                      const SizedBox(height: 15),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Username',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 15),
                            TextField(
                              maxLines: null,
                              onChanged: (String val) {
                                name = val;
                              },
                              controller: nameController,
                              decoration: const InputDecoration(
                                  hintText: 'Input your name',
                                  border: OutlineInputBorder()),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Review',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 15),
                            TextField(
                              maxLines: null,
                              onChanged: (String val) {
                                review = val;
                              },
                              controller: reviewController,
                              decoration: const InputDecoration(
                                  hintText: 'Input your review',
                                  border: OutlineInputBorder()),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        child: SizedBox(
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () {
                              if (!formKey.currentState!.validate()) return;
                              formKey.currentState!.save();
                              contactProvider.add(GetReview(
                                name: name,
                                review: review,
                              ));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            child: const Text(
                              'Submit',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: Colors.white, width: 3))),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: contactProvider.reviews.length,
                          itemBuilder: (BuildContext context, index) {
                            return ListTile(
                              title: Text(
                                contactProvider.reviews[index].name,
                                style: const TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                  contactProvider.reviews[index].review,
                                  style: const TextStyle(color: Colors.white)),
                            );
                          }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget txt(String text, {FontWeight? fontWeight, double? txtsize}) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: txtsize ?? 14.0,
      ),
    );
  }


  // Widget customTextField(
  //   String label,
  //   VoidCallback onChanged,
  //   TextEditingController controller,
  //   String hintText,
  // ) {
  //   return Container(
  //     padding: const EdgeInsets.symmetric(vertical: 10),
  //     margin: const EdgeInsets.symmetric(horizontal: 20),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
  //         const SizedBox(height: 15),
  //         TextField(
  //           maxLines: null,
  //           onChanged: (val) => onChanged,
  //           controller: controller,
  //           decoration: InputDecoration(
  //               hintText: hintText, border: const OutlineInputBorder()),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
