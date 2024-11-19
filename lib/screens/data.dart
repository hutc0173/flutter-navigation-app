import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Weather {
  final String dateTime;
  final String description;
  final double temperature;

  Weather({
    required this.dateTime,
    required this.description,
    required this.temperature,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      dateTime: json['dt_txt'] ?? 'No Date',
      description: json['weather'][0]['description'] ?? 'No Description',
      temperature: (json['main']['temp'] as num?)?.toDouble() ?? 0.0,
    );
  }
}

class DataScreen extends StatefulWidget {
  const DataScreen({Key? key}) : super(key: key);

  @override
  DataScreenState createState() => DataScreenState();
}

class DataScreenState extends State<DataScreen> {
  late Future<List<Weather>> futureWeather;

  @override
  void initState() {
    super.initState();
    futureWeather = fetchWeather();
  }

  Future<List<Weather>> fetchWeather() async {
    try {
      String apiKey = dotenv.env['API_KEY'] ?? '';
      if (apiKey.isEmpty) {
        throw Exception('API key is missing');
      }

      const String city = 'Ottawa';
      final response = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$city&units=metric&appid=$apiKey',
        ),
      );

      print('Response Status Code: ${response.statusCode}');
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final List<dynamic> weatherList = data['list'];

        return weatherList
            .take(10)
            .map((item) => Weather.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Failed to fetch weather data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather in Ottawa'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: FutureBuilder<List<Weather>>(
        future: futureWeather,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available'));
          } else {
            final List<Weather> weatherData = snapshot.data!;

            return ListView.builder(
              itemCount: weatherData.length,
              padding: const EdgeInsets.all(8.0),
              itemBuilder: (context, index) {
                final weather = weatherData[index];
                return Card(
                  color: Theme.of(context).colorScheme.surface,
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.cloud,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    title: Text(
                      weather.dateTime,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(
                      '${weather.description}, ${weather.temperature}°C',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
