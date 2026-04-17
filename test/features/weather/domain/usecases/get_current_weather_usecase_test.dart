import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/features/weather/domain/entities/weather.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather_app/features/weather/domain/usecases/get_current_weather_usecase.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  late GetCurrentWeatherUseCase usecase;
  late MockWeatherRepository mockWeatherRepository;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    usecase = GetCurrentWeatherUseCase(mockWeatherRepository);
  });

  const tCityName = 'London';
  const tWeather = Weather(
    cityName: 'London',
    temperature: 20.0,
    condition: 'Clouds',
    description: 'scattered clouds',
    iconCode: '03d',
    humidity: 50,
    windSpeed: 5.0,
  );

  test('should get current weather from the repository', () async {
    // arrange
    when(() => mockWeatherRepository.getCurrentWeather(tCityName))
        .thenAnswer((_) async => tWeather);

    // act
    final result = await usecase(tCityName);

    // assert
    expect(result, tWeather);
    verify(() => mockWeatherRepository.getCurrentWeather(tCityName)).called(1);
    verifyNoMoreInteractions(mockWeatherRepository);
  });
}
