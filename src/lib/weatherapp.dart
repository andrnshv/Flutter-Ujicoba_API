import 'package:flutter/material.dart';
import 'package:ujicoba_api/model.dart';
import 'client.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherApp(),
    );
  }
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  WeatherModel? weather;
  List<dynamic> hourlyTemp = [];
  List<dynamic> hourlyDate = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212121),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Text(
                  "Current Weather",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Icon(
                  Icons.sunny,
                  color: Colors.amber,
                  size: 64,
                ),
                const SizedBox(height: 20),
                Text(
                  "${weather?.currentWeather["temperature"] ?? 0}°C",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    final result =
                        await Weatherapiclient().request();

                    setState(() {
                      weather = result;
                      hourlyTemp =
                          weather?.hourly["temperature_2m"] ?? [];
                      hourlyDate =
                          weather?.hourly["time"] ?? [];
                    });
                  },
                  child: const Text("Get Data"),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.all(12),
                  height: 400,
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF313131),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: hourlyTemp.isNotEmpty
                      ? ListView.builder(
                          itemCount: hourlyTemp.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(
                                vertical: 2,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                children: [
                                  Text(
                                    hourlyDate[index].toString(),
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    "${hourlyTemp[index]} °C",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight:
                                          FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      : const Center(
                          child: Text(
                            "Empty",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}