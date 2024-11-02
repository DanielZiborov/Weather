part of 'weather_block_bloc.dart';

sealed class WeatherBlockState extends Equatable {
  const WeatherBlockState();
  
  @override
  List<Object> get props => [];
}

final class WeatherBlockInitial extends WeatherBlockState {}
