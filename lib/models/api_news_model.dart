class ApiNewsModel {
  String tittle;
  String? description;
  String pubDate;
  String? imageUrl;
  String? sourceName;
  List category;
  ApiNewsModel({
    required this.tittle,
    required this.description,
    required this.pubDate,
    required this.imageUrl,
    required this.sourceName,
    required this.category,
  });

  factory ApiNewsModel.fromMap({required Map<String, dynamic> data}) {
    return ApiNewsModel(
      tittle: data['title'],
      description: data['description'],
      pubDate: data['pubDate'],
      imageUrl: data['image_url'],
      sourceName: data['source_name'],
      category: data['category'],
    );
  }
}
