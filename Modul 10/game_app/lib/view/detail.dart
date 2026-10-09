import 'package:flutter/material.dart';
import 'package:game_app/model/detailgame.dart';
import 'package:game_app/viewmodel/fetchgame.dart';
import 'package:readmore/readmore.dart';

class Detail extends StatelessWidget {
  final int gameTerpilih;

  const Detail({
    super.key,
    required this.gameTerpilih,
  });

  Future<DetailGame> fetchData() async {
    final jsonData = await fetchDataFromAPI(gameTerpilih);
    return DetailGame.fromJson(jsonData);
  }

  Widget _itemList(String url) {
    return SizedBox(
      width: 250,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _requirementRow(String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Expanded(
          flex: 1,
          child: Text(':'),
        ),
        Expanded(
          flex: 8,
          child: Text(value),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<DetailGame>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
              ),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: Text(
                'Data tidak ditemukan',
              ),
            );
          }

          final game = snapshot.data!;

          return SafeArea(
            child: Column(
              children: [
                // HEADER / THUMBNAIL
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      child: Image.network(
                        game.thumbnail,
                        width: double.infinity,
                        height: 220,
                        fit: BoxFit.cover,
                      ),
                    ),

                    // TOMBOL KEMBALI
                    Positioned(
                      top: 10,
                      left: 10,
                      child: CircleAvatar(
                        backgroundColor: Colors.black54,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),

                // ISI DETAIL
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // JUDUL
                        Text(
                          game.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),

                        // INFORMASI GAME
                        Text('Genre: ${game.genre}'),
                        Text('Platform: ${game.platform}'),
                        Text('Publisher: ${game.publisher}'),
                        Text('Developer: ${game.developer}'),
                        Text('Release Date: ${game.release_date}'),
                        Text('Status: ${game.status}'),

                        const SizedBox(height: 20),

                        // SHORT DESCRIPTION
                        Text(
                          game.short_description,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),

                        const SizedBox(height: 20),

                        // MINIMUM SYSTEM REQUIREMENTS
                        const Text(
                          'Minimum System Requirements',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              _requirementRow(
                                'OS',
                                game.minimum_system_requirements.os,
                              ),
                              const SizedBox(height: 8),
                              _requirementRow(
                                'Processor',
                                game.minimum_system_requirements.processor,
                              ),
                              const SizedBox(height: 8),
                              _requirementRow(
                                'Memory',
                                game.minimum_system_requirements.memory,
                              ),
                              const SizedBox(height: 8),
                              _requirementRow(
                                'Graphics',
                                game.minimum_system_requirements.graphics,
                              ),
                              const SizedBox(height: 8),
                              _requirementRow(
                                'Storage',
                                game.minimum_system_requirements.storage,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        // SCREENSHOTS
                        const Text(
                          'Screenshots',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        SizedBox(
                          height: 150,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: game.screenshots.length,
                            separatorBuilder: (context, index) {
                              return const SizedBox(width: 10);
                            },
                            itemBuilder: (context, index) {
                              return _itemList(
                                game.screenshots[index].image,
                              );
                            },
                          ),
                        ),

                        const SizedBox(height: 20),

                        // DESCRIPTION
                        const Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        ReadMoreText(
                          game.description,
                          trimLines: 2,
                          colorClickableText: Colors.blue,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'more',
                          trimExpandedText: 'less',
                        ),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}