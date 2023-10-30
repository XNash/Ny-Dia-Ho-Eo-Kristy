import 'package:Ny_Dia_Ho_Eo_Amin_i_Kristy/screens/player_page.dart';
import 'package:flutter/material.dart';

import '../global.dart';

class AsListPage extends StatefulWidget {
  const AsListPage({Key? key}) : super(key: key);

  @override
  State<AsListPage> createState() => _AsListPageState();
}

class _AsListPageState extends State<AsListPage> {
  @override
  Widget build(BuildContext context) {
    Icon icon;
    if (Global.index == 0) {
      icon = Icon(
        Icons.info,
        color: Colors.white.withOpacity(0.8),
      );
    } else {
      icon = Icon(
        Icons.arrow_forward_ios,
        color: Colors.white.withOpacity(0.8),
      );
    }
    return Scaffold(
      backgroundColor: const Color(0xFF003B6A),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Ny Dia Ho Eo Amin'i Kristy",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 15),
            onPressed: () {
              if (Global.index == 0) {
                Navigator.of(context).pushReplacementNamed("info_page");
              } else {
                PlayerPage.continues = true;
                Navigator.of(context).pushNamed("player_page");
              }
            },
            icon: icon,
          ),
        ],
      ),
      body: chapList(),
    );
  }

  ListView chapList() {
    return ListView.builder(
      itemCount: Global.songs.length,
      itemBuilder: (context, i) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Card(
          elevation: 1,
          child: ListTile(
            onTap: () {
              setState(() {
                if (Global.index != 0) {
                  Global.playSong['player'].stop();
                }
                Global.index = i;
                Global.playSong = Global.songs[i];
              });
              Navigator.of(context).pushNamed("player_page");
            },
            leading: Image.asset(
              "${Global.songs[i]["image"]}",
              width: 70,
            ),
            title: Text(
              "${Global.songs[i]["name"]}",
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "${Global.songs[i]["sub"]}",
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
