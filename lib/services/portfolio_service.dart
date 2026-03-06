import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:my_portfolio/models/portfolio_model.dart';

class PortfolioService {
  static late PortfolioModel data;

  static Future<void> loadData() async {
    final String jsonString = await rootBundle.loadString('assets/data/portfolio.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    data = PortfolioModel.fromJson(jsonMap);
  }
}
