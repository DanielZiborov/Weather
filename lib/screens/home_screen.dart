import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/widgets/decorated_widget.dart';
import 'package:weather_app/widgets/row_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0.7 * kToolbarHeight, 10, 10),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              const DecoratedWidget(
                x: -3,
                y: -0.3,
                color: Colors.deepPurple,
                width: 300,
                height: 300,
                shape: BoxShape.circle,
              ),
              const DecoratedWidget(
                x: 3,
                y: -0.3,
                color: Colors.deepPurple,
                width: 300,
                height: 300,
                shape: BoxShape.circle,
              ),
              const DecoratedWidget(
                x: 0,
                y: -1.2,
                color: Colors.orangeAccent,
                width: 600,
                height: 300,
                shape: BoxShape.rectangle,
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    const Text(
                      'Moskow',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Good Morning',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image.asset(
                      'assets/images/3.png',
                      scale: 2,
                    ),
                    const Text(
                      '21°C',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 55,
                          fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      'vsnsbv',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "vbfhvhbhf",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w300),
                    ),
                    const RowWidget(
                      image1: "assets/images/11.png",
                      image2: "assets/images/12.png",
                      text11: 'Sunrise',
                      text12: '6-34am',
                      text21: 'Sunset',
                      text22: "6-34pm",
                    ),
                    const SizedBox(height: 5),
                    const Divider(color: Colors.grey),
                    const SizedBox(height: 5),
                    const RowWidget(
                      image1: "assets/images/13.png",
                      image2: "assets/images/14.png",
                      text11: 'Temp max',
                      text12: '12°C',
                      text21: 'Temp min',
                      text22: "8°C",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
