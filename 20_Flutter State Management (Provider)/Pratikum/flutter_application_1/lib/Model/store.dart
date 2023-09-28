import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/review.dart';

class Review with ChangeNotifier {
  final List<GetReview> _reviews = [];
  List<GetReview> get reviews => _reviews;

  void add(GetReview review) {
    _reviews.add(review);
    notifyListeners();
  }
}
