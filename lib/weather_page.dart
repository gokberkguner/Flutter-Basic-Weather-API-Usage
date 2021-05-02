import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  var sicaklik;
  var genelHava;
  var hava;
  var sehir;
  var nem;
  var ruzgarHizi;

  Future getWeather() async {
    var response = await http.get(
        "https://api.openweathermap.org/data/2.5/weather?q=İstanbul&units=metric&appid=d8e79be1cd8d474322584ad54f32d80b");
    var sonuc = jsonDecode(response.body);
    setState(() {
      this.sicaklik = sonuc["main"]["temp"];
      this.genelHava = sonuc["weather"][0]["main"];
      this.hava = sonuc["weather"][0]["description"];
      this.sehir = sonuc["name"];
      this.nem = sonuc["main"]["humidity"];
      this.ruzgarHizi = sonuc["wind"]["speed"];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.0, 20.0],
                  colors: [Colors.teal, Colors.black]),
              color: Colors.teal,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 90,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    sehir != null ? sehir.toString() : "Yükleniyor...",
                    style: GoogleFonts.inter(
                      fontSize: 34,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(1.0, 3.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    sicaklik != null
                        ? sicaklik.toString() + "\u00B0C"
                        : "Yükleniyor...",
                    style: GoogleFonts.inter(
                      fontSize: 54,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(2.0, 5.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    genelHava != null ? genelHava.toString() : "Yükleniyor...",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(0.5, 2.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: CircleAvatar(child: Icon(Icons.thermostat_outlined)),
                  title: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "Hava Sıcaklığı",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  trailing: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        sicaklik != null
                            ? sicaklik.toString() + "\u00B0C"
                            : "Yükleniyor...",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.wb_cloudy_outlined),
                  ),
                  title: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "Hava Durumu",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  trailing: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        hava != null ? hava.toString() : "Yükleniyor...",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(child: Icon(Icons.wb_sunny_outlined)),
                  title: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "Nem Oranı",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  trailing: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        nem != null ? nem.toString() : "Yükleniyor...",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.waterfall_chart),
                  ),
                  title: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "Rüzgar Hızı",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  trailing: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ruzgarHizi != null
                            ? ruzgarHizi.toString()
                            : "Yükleniyor...",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
