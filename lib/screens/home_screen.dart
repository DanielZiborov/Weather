import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_block_bloc.dart';
import 'package:weather_app/widgets/decorated_widget.dart';
import 'package:weather_app/widgets/row_widget.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300:
        return Image.asset(
          'assets/images/1.png',
          scale: 2,
        );
      case >= 300 && < 400:
        return Image.asset(
          'assets/images/2.png',
          scale: 2,
        );
      case >= 500 && < 600:
        return Image.asset(
          'assets/images/3.png',
          scale: 2,
        );
      case >= 600 && < 700:
        return Image.asset(
          'assets/images/4.png',
          scale: 2,
        );
      case >= 700 && < 800:
        return Image.asset(
          'assets/images/5.png',
          scale: 2,
        );
      case == 800:
        return Image.asset(
          'assets/6.png',
          scale: 2,
        );
      case > 800 && <= 804:
        return Image.asset(
          'assets/images/7.png',
          scale: 2,
        );
      default:
        return Image.asset(
          'assets/images/8.png',
          scale: 2,
        );
    }
  }

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
              BlocBuilder<WeatherBlockBloc, WeatherBlockState>(
                builder: (context, state) {
                  if (state is! WeatherBlockSuccess) {
                    return Container();
                  }
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        Text(
                          '${state.weather.areaName}',
                          style: const TextStyle(
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
                        getWeatherIcon(state.weather.weatherConditionCode!),
                        Text(
                          '${state.weather.temperature!.celsius!.round()}°C',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 55,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          state.weather.weatherMain!.toUpperCase(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          DateFormat('EEEE dd •')
                              .add_jm()
                              .format(state.weather.date!),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w300),
                        ),
                        RowWidget(
                          image1: "assets/images/11.png",
                          image2: "assets/images/12.png",
                          text11: 'Sunrise',
                          text12: DateFormat()
                              .add_jm()
                              .format(state.weather.sunrise!),
                          text21: 'Sunset',
                          text22: DateFormat()
                              .add_jm()
                              .format(state.weather.sunset!),
                        ),
                        const SizedBox(height: 5),
                        const Divider(color: Colors.grey),
                        const SizedBox(height: 5),
                        RowWidget(
                          image1: "assets/images/13.png",
                          image2: "assets/images/14.png",
                          text11: 'Temp max',
                          text12:
                              '${state.weather.tempMax!.celsius!.round()}°C',
                          text21: 'Temp min',
                          text22:
                              '${state.weather.tempMin!.celsius!.round()}°C',
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
