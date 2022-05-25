import 'package:flutter/material.dart';
import 'package:weather/data/my_location.dart';
import 'package:weather/data/network.dart';
import 'package:weather/screens/weather_screen.dart';
const apikey = '0d30e08315dc54d7e2eedf37a15103ae';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late double latitude3;
  late double longitude3;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;
    print(latitude3);
    print(longitude3);

    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&appid=$apikey&units=metric');

    var weatherData = await network.getJsonData();
    print(weatherData);
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return WeatherScreen(parseWeatherData: weatherData,);
    }));
  }

  // void fetchData() async {
  //     var myJson = parsingData['weather'][0]['description'];
  //     var wind = parsingData['wind']['speed'];
  //     var id = parsingData['id'];
  //     print(myJson);
  //     print(wind);
  //     print(id);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: null,
          child: const Text('Get my location'),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            textStyle: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
