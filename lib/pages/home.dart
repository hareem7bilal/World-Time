import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty? data:ModalRoute.of(context)?.settings.arguments as Map;
    print(data);

    String bgImg = data['isDayTime'] ? 'day.jpg' : 'night.jpg';
    Color? bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$bgImg'), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child: Column(
            children: [
              TextButton.icon(
                onPressed: () async {
                  dynamic result=await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data={
                      'time':result['time'],
                      'location': result['location'],
                      'isDayTime': result['isDayTime'],
                      'flag': result['flag'],
                    };
                  });
                },
                style: TextButton.styleFrom(
                  primary: Colors.grey[300],
                ),
                icon: Icon(Icons.edit_location),
                label: Text('Edit Location'),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(data['location'],
                      style: TextStyle(fontSize: 28.0, letterSpacing: 2.0,color: Colors.white)),
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                data['time'],
                style: TextStyle(fontSize: 66.0,color: Colors.white),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
