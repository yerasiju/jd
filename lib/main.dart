import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue[50], // Added background color
        appBar: AppBar(
          title: Text(
            'Weather',
            style: TextStyle(color: Colors.black87),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
          iconTheme: IconThemeData(color: Colors.black54),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.settings), onPressed: () {}),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget> [
              _headerImage(),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      _weatherDescription(),
                      Divider(),
                      _temperature(),
                      Divider(),
                      _temperatureForecast(),
                      Divider(),
                      _footerRatings(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Image _headerImage(){
  return Image(
    image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaZ2_esmFn5-78Pq2YUCcQZjNkh9CHRT06Qw&s'),
    fit: BoxFit.cover,
  );
}

Column _weatherDescription(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Text(
        'Tuesday - June 17',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
      ),
      Divider(),
      Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada quam at tellus ornare, et vehicula arcu fringilla.',
        style: TextStyle(color: Colors.black54),
        textAlign: TextAlign.center, // Added text alignment for better layout
      ),
    ],
  );
}

Row _temperature() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(
        Icons.wb_sunny_sharp,
        color: Colors.yellow,
      ),
      SizedBox(width: 16.0),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                '15° Clear',
                style: TextStyle(color: Colors.deepPurple),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                'Jambyl Region, Taraz',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

Wrap _temperatureForecast() {
  return Wrap(
    spacing: 10.0,
    children: List.generate(8, (int index) {
      return Chip(
        label: Text(
          '${index + 20}°C',
          style: TextStyle(fontSize: 15.0),
        ),
        avatar: Icon(
          Icons.wb_cloudy_rounded,
          color: Colors.blue.shade300,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: BorderSide(color: Colors.grey),
        ),
        backgroundColor: Colors.grey.shade300,
      );
    }),
  );
}

Row _footerRatings() {
  var stars = Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Icon(Icons.star, size: 15, color: Colors.yellow[700]),
      Icon(Icons.star, size: 15, color: Colors.yellow[700]),
      Icon(Icons.star, size: 15, color: Colors.yellow[700]),
      Icon(Icons.star, size: 15, color: Colors.yellow[700]),
      Icon(Icons.star_half, size: 15, color: Colors.yellow[700]),
    ],
  );
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Text(
        'Info with openweathermap.org',
        style: TextStyle(fontSize: 15),
      ),
      stars,
    ],
  );
}
