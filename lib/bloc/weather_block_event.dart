// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'weather_block_bloc.dart';

sealed class WeatherBlockEvent extends Equatable {
  const WeatherBlockEvent();

  @override
  List<Object> get props => [];
}

class FetchWeather extends WeatherBlockEvent {
  final Position position;
  const FetchWeather(this.position);
  @override
  List<Object> get props => [position];
}
