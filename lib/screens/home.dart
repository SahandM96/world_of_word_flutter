import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_of_words/blocs/bloc/words_bloc.dart';
import 'package:world_of_words/models/word.dart';
import 'package:glassmorphism/glassmorphism.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WordsBloc, WordsState>(builder: (context, state) {
      if (state is WordsInitial) {
        context.read<WordsBloc>().add(LoadWordsDataEvent());
        return const Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.blueAccent,
          ),
        );
      } else if (state is WordsLoading) {
        return const Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.purpleAccent,
          ),
        );
      } else if (state is WordsError) {
        return const Center(
          child: Text("Error"),
        );
      } else if (state is WordsLoaded) {
        return buildWordsModel(state.apiResult);
      }
      return const Center(child: Text("error"));
    });
  }

  Widget buildWordsModel(List<Word> apiResult) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 15.0),
      itemCount: apiResult.length,
      itemBuilder: (BuildContext context, int index) {
        final Word dataModel = apiResult[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
          child: InkWell(
            onTap: () {
              debugPrint(dataModel.lastUpdate.toString());
              // context.router.push(DetailsRoute(dataModel: dataModel));
            },
            child: SizedBox(
              width: double.infinity,
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      height: 90,
                      //width: (MediaQuery.of(context).size.width / 3) * 1,
                      fit: BoxFit.fitHeight,
                      image: NetworkImage(dataModel.imageCategory),
                    ),
                    GlassmorphicContainer(
                      width: (MediaQuery.of(context).size.width / 3) * 2,
                      height: 90,
                      border: 0,
                      borderRadius: 0,
                      blur: 25,
                      alignment: Alignment.centerLeft,
                      linearGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color.fromARGB(255, 53, 26, 255)
                              .withOpacity(0.5),
                          const Color.fromARGB(255, 245, 142, 213)
                              .withOpacity(0.05),
                        ],
                        stops: const [
                          0.1,
                          1.5,
                        ],
                      ),
                      borderGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color.fromARGB(255, 245, 142, 213)
                              .withOpacity(0.5),
                          const Color.fromARGB(255, 53, 26, 255)
                              .withOpacity(0.5),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Center(
                                child: Text(
                                  dataModel.word,
                                  style: const TextStyle(
                                    fontFamily: "IranSans",
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            const Divider(),
                            Text(
                              "Tag: ${dataModel.tag}",
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "Category: ${dataModel.category}",
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
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
        );
      },
    );
  }
}
