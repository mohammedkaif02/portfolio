import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mr_portfolio/core/constants/app_constants.dart';
import 'package:mr_portfolio/features/cv/domain/repositories/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final http.Client client;

  LocationRepositoryImpl({http.Client? client}) : client = client ?? http.Client();

  @override
  Future<String?> getCountryFromIP() async {
    try {
      final response = await client.get(Uri.parse(AppConstants.locationApiUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['country']; // e.g., "India"
      }
    } catch (e) {
      debugPrint('Failed to fetch country: $e');
    }
    return null;
  }
}
