import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/data/my_data.dart';

part 'weather_block_event.dart';
part 'weather_block_state.dart';

class WeatherBlockBloc extends Bloc<WeatherBlockEvent, WeatherBlockState> {
  WeatherBlockBloc() : super(WeatherBlockInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherBlockLoading());
      try {
        WeatherFactory wf = WeatherFactory(apiKey);
        final Position position = await Geolocator.getCurrentPosition();
        Weather weather = await wf.currentWeatherByLocation(
          position.latitude,
          position.longitude,
        );
        print(weather);
        emit(WeatherBlockSuccess(weather: weather));
      } catch (e) {
        emit(WeatherBlockFailure());
      }
    });
  }
}
