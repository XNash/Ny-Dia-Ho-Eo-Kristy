import 'package:Ny_Dia_Ho_Eo_Amin_i_Kristy/screens/aslist_page.dart';
import 'package:Ny_Dia_Ho_Eo_Amin_i_Kristy/screens/home_page.dart';
import 'package:Ny_Dia_Ho_Eo_Amin_i_Kristy/screens/info_page.dart';
import 'package:Ny_Dia_Ho_Eo_Amin_i_Kristy/screens/player_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      debugShowCheckedModeBanner: false,
      routes: {
        "aslist_page": (context) => const AsListPage(),
        "/": (context) => const HomePage(),
        "player_page": (context) => PlayerPage(),
        "info_page": (context) => const InfoPage(),
      },
    ),
  );
}
