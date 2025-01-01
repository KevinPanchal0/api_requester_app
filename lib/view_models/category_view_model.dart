import 'package:api_requester_app/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryViewModel extends ChangeNotifier {
  final List<CategoryModel> items = [
    CategoryModel(category: 'Business'),
    CategoryModel(category: 'Crime'),
    CategoryModel(category: 'Domestic'),
    CategoryModel(category: 'Health'),
    CategoryModel(category: 'Lifestyle'),
  ];

  final List<String> categories = [
    'business',
    'crime',
    'domestic',
    'health',
    'lifestyle',
  ];

  String _selectedCategory = 'Business';

  String get selectedCategory => _selectedCategory;

  List<CategoryModel> get filteredItems =>
      items.where((item) => item.category == _selectedCategory).toList();

  void selectCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }
}
