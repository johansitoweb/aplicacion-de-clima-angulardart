import 'package:angular/angular.dart';
import 'weather_service.dart';

@Component(
  selector: 'weather',
  template: '''
    <div>
      <h1>Información del Clima</h1>
      <input #cityInput placeholder="Ingresa una ciudad" />
      <button (click)="getWeather(cityInput.value)">Obtener Clima</button>
      <div *ngIf="weather != null">
        <h2>{{ weather['name'] }}</h2>
        <p>Temperatura: {{ weather['main']['temp'] }} °C</p>
        <p>Condición: {{ weather['weather'][0]['description'] }}</p>
      </div>
    </div>
  ''',
  directives: [coreDirectives],
)
class WeatherComponent {
  final WeatherService _weatherService;
  Map<String, dynamic>? weather;

  WeatherComponent(this._weatherService);

  void getWeather(String city) async {
    weather = await _weatherService.getWeather(city);
  }
}
