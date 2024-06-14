import 'package:flutter/material.dart';
import 'package:my_app_project/domain/Weather.dart';

class WeaterScreen extends StatefulWidget {
  @override
  _WeaterScreen createState() => _WeaterScreen();
}

class _WeaterScreen extends State<WeaterScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text("날씨 ^^~")),
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
                          color: Colors.lightBlueAccent
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
                      children: <Widget> [
                        Container(
                          padding: EdgeInsets.all(10.0), margin: EdgeInsets.all(10.0),
                          child: Text('${_weather.location}',
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white
                            ),
                          ),
                        ),
                        Container(
                          /*padding: EdgeInsets.fromLTRB(10,10,0,0),*/ margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                          child: Text(
                            '${(double.parse(_weather.temperature.toString()) < 10)
                                ? '날씨가 추워요.\n외출할 때는 따듯하게~~'
                                : '외출 하기 좋은 날씨에요~\n즐거운 하루 되세요~~'}',
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0), margin: EdgeInsets.fromLTRB(10, 0, 0, 80),
                          child: Text(
                            '${DateFormat('MM.dd HH:mm 기준').format(DateTime.now())}',
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
                              margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                elevation: 4.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(top: 10, bottom: 0),
                                      child: Icon(Icons.sunny,color: Colors.amberAccent,),
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
                              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                elevation: 4.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(top: 10, bottom: 0),
                                      child: Icon(Icons.thermostat, color: Colors.deepOrangeAccent,),
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
                              margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                elevation: 4.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(top: 10, bottom: 0),
                                      child: Icon(Icons.air, color: Colors.black26,),
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
      ),
    );
  }