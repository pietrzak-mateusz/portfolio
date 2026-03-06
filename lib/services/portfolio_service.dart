import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:my_portfolio/models/portfolio_model.dart';

class PortfolioService {
  static late PortfolioModel data;

  static Future<void> loadData() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/data/portfolio.json');
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      data = PortfolioModel.fromJson(jsonMap);
    } catch (e) {
      // In a real app we might want to log this to a crash reporting service,
      // but for now we provide a safe empty fallback.
      if (kDebugMode) {
        print('Error loading portfolio.json: $e');
      }
      data = PortfolioModel.fromJson(null);
    }
  }
}
