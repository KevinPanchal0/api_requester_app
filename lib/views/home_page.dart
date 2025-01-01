import 'package:api_requester_app/models/api_news_model.dart';
import 'package:api_requester_app/utlis/cards/news_card.dart';
import 'package:api_requester_app/utlis/helpers/news_api_helper.dart';
import 'package:api_requester_app/view_models/category_view_model.dart';
import 'package:draggable_carousel_slider/draggable_carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TabController tabController;
  late Future<List<ApiNewsModel>?> getApi;

  @override
  void initState() {
    super.initState();
    getApi = NewsApiHelper.newsApiHelper.fetchAllNews();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CategoryViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("News App"),
      ),
      body: FutureBuilder(
        future: NewsApiHelper.newsApiHelper.fetchAllNews(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("There is some Error ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<ApiNewsModel>? data = snapshot.data;

            return (data == null)
                ? const Center(
                    child: Text("No News is available"),
                  )
                : Center(
                    child: Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Wrap(
                            spacing: 25,
                            children: viewModel.categories.map(
                              (category) {
                                return ChoiceChip(
                                  label: Text(category.toUpperCase()),
                                  selected:
                                      viewModel.selectedCategory == category,
                                  onSelected: (bool selected) async {
                                    if (selected) {
                                      viewModel.selectCategory(category);
                                      // getApi =
                                    }
                                  },
                                );
                              },
                            ).toList(),
                          ),
                        ),
                        const SizedBox(
                          height: 69,
                        ),
                        DraggableSlider(
                          loop: true,
                          children: List.generate(
                            data.length,
                            (index) => newsCard(
                              data[index].tittle,
                              data[index].description,
                              data[index].pubDate,
                              data[index].imageUrl,
                              data[index].sourceName,
                              data[index].category[0],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
