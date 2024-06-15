import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app_project/domain/Weather.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:intl/intl.dart';
import 'package:my_app_project/widgets/customDrawer.dart';

import '../util/values.dart';

Logger log = Logger();

class WeaterScreen extends StatefulWidget {
  @override
  _WeaterScreen createState() => _WeaterScreen();
}

class _WeaterScreen extends State<WeaterScreen> {
  @override
  void initState() {
    super.initState();
    _getLocationAndWeather();
  }

  late Weather _weather = Weather(
    location: '00',
    temperature: '20',
    description: 'no Data',
    main: 'no Data',
  );

  Future<void> _getLocationAndWeather() async {
    // TODO: 위치 정보 가져오기 (위치 권한 확인 필요)


    // OpenWeatherMap API 호출
    final String apiKey = '76233c1c97b569660cd8ddb2b9a069f9';
    final String apiUrl = 'https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=${apiKey}&units=metric';
    final http.Response response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // API 응답 성공
      final Map<String, dynamic> data = json.decode(response.body);

      log.i(data);

      setState(() {
        _weather = Weather(
          location: data['name'],
          temperature: data['main']['temp'].toString(),
          description: data['weather'][0]['description'],
          main: data['weather'][0]['main'],
        );
      });
    } else {
      // API 응답 실패
      //throw Exception('Failed to load weather');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
              elevation: Sizes.ELEVATION_0,
              backgroundColor: AppColors.blue,
              title: Text("오늘의 날씨")),
          endDrawer: CustomDrawer(),
          body: Center(
            child: _weather.location == "00" ? CircularProgressIndicator() :
            Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(padding: EdgeInsets.all(10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '지역: ${_weather.location}',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackShade
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 400, width: 400,
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      side: BorderSide(width: 0.0),
                    ),
                    elevation: 8.0,
                    color: Color(0xFF303f60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.all(10.0),
                          child: Text('${_weather.location}',
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white
                            ),
                          ),
                        ),
                        Container(
                          /*padding: EdgeInsets.fromLTRB(10,10,0,0),*/
                          margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                          child: Text(
                            '${(double.parse(_weather.temperature.toString()) <
                                10)
                                ? '날씨가 추워요.'
                                : '따뜻한 날씨'}',
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 80),
                          child: Text(
                            '${DateFormat('MM.dd HH:mm 기준').format(
                                DateTime.now())}',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white
                            ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 100, height: 100,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 10),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                elevation: 4.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 10, bottom: 0),
                                      child: Icon(Icons.sunny,
                                        color: Colors.amberAccent,),
                                    ),
                                    Text("날씨"),
                                    Container(
                                      margin: EdgeInsets.symmetric(vertical: 5),
                                      child: Text('${_weather.main}'),
                                    )

                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 100, height: 100,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 10),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                elevation: 4.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 10, bottom: 0),
                                      child: Icon(Icons.thermostat,
                                        color: Colors.deepOrangeAccent,),
                                    ),
                                    Text("기온"),
                                    Container(
                                      margin: EdgeInsets.symmetric(vertical: 5),
                                      child: Text('${_weather.temperature}°C'),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 100, height: 100,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 10),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                elevation: 4.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 10, bottom: 0),
                                      child: Icon(
                                        Icons.air, color: Colors.black26,),
                                    ),
                                    Text("대기수준"),
                                    Container(
                                      margin: EdgeInsets.symmetric(vertical: 5),
                                      child: Text('${_weather.description}'),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),


              ],
            ),
          )
      );
  }
}