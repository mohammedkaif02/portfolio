import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/features/cv/domain/repositories/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final http.Client client;

  LocationRepositoryImpl({http.Client? client})
    : client = client ?? http.Client();

  @override
  Future<String?> getCountryFromIP() async {
    // Primary HTTPS Attempt
    try {
      final response = await client
          .get(Uri.parse(AppConstants.locationApiUrl))
          .timeout(const Duration(seconds: 4));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final country = data['country_name'] ?? data['country'];
        if (country != null && country is String && country.isNotEmpty) {
          return country;
        }
      }
    } catch (e) {
      debugPrint('Primary location fetch failed: $e');
    }

    // Secondary Resilient Fallback HTTPS Attempt
    try {
      final response = await client
          .get(Uri.parse(AppConstants.fallbackLocationApiUrl))
          .timeout(const Duration(seconds: 4));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final country = data['country'];
        if (country != null && country is String && country.isNotEmpty) {
          return country;
        }
      }
    } catch (e) {
      debugPrint('Fallback location fetch failed: $e');
    }

    return null;
  }
}
