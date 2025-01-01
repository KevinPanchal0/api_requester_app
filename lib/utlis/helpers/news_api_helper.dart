import "dart:convert";

import "package:api_requester_app/models/api_news_model.dart";
import "package:http/http.dart" as http;

class NewsApiHelper {
  NewsApiHelper._();

  static final NewsApiHelper newsApiHelper = NewsApiHelper._();

  Future<List<ApiNewsModel>?> fetchAllNews() async {
    String newsApi =
        'https://newsdata.io/api/1/news?apikey=pub_63143bbf297e23617029ea272be484a068b80&country=in&language=en';

    http.Response response = await http.get(Uri.parse(newsApi));

    if (response.statusCode == 200) {
      String data = response.body;

      Map allNewsResult = jsonDecode(data);

      List allNewsList = allNewsResult['results'];
      List<ApiNewsModel> allNewsResultModel =
          allNewsList.map((e) => ApiNewsModel.fromMap(data: e)).toList();

      return allNewsResultModel;
    }
    return null;
  }

  Future<List<ApiNewsModel>?> fetchNewByCategory(String category) async {
    String newsApi =
        'https://newsdata.io/api/1/news?apikey=pub_63143bbf297e23617029ea272be484a068b80&country=in&language=en&category=$category';

    http.Response response = await http.get(Uri.parse(newsApi));

    if (response.statusCode == 200) {
      String data = response.body;

      Map allNewsResult = jsonDecode(data);

      List allNewsList = allNewsResult['results'];
      List<ApiNewsModel> allNewsResultModel =
          allNewsList.map((e) => ApiNewsModel.fromMap(data: e)).toList();

      return allNewsResultModel;
    }
    return null;
  }
}
