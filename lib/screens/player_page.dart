import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import '../global.dart';

class PlayerPage extends StatefulWidget {
  static bool continues = false;

  PlayerPage({Key? key}) : super(key: key);

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  bool isPlay = false;

  initAudio() async {
    isPlay = true;
    await Global.playSong['player'].open(
      Audio(Global.playSong['path']),
      autoStart: true,
    );

    setState(() {
      Global.playSong['totalDuration'] =
          Global.playSong['player'].current.value!.audio.duration;
    });
  }

  @override
  void initState() {
    super.initState();
    if (!PlayerPage.continues) {
      initAudio();
    } else {
      isPlay = true;
    }
  }

  Future<void> pauseMusic() async {
    await Global.playSong["player"].pause();
  }

  @override
  void dispose() async {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF003B6A),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF003B6A),
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 2,
        centerTitle: true,
        title: const Text(
          "Ny Dia Ho Eo Amin'i Kristy",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed("info_page");
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.transparent),
              ),
              child: const Icon(
                Icons.info,
                color: Colors.white,
              )),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "${Global.playSong["sub"]}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            const Divider(color: Colors.white),
            const Spacer(),
            Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.grey.shade600,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("${Global.playSong["image"]}"),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            StreamBuilder(
              stream: Global.playSong['player'].currentPosition,
              builder: (context, AsyncSnapshot<Duration> snapshot) {
                Duration? currentPosition = snapshot.data;

                return Column(
                  children: [
                    Text(
                      "${"$currentPosition".split(".")[0]} / ${"${Global.playSong['totalDuration']}".split(".")[0]}",
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Slider(
                      min: 0,
                      max:
                          Global.playSong['totalDuration'].inSeconds.toDouble(),
                      value: (currentPosition != null)
                          ? currentPosition.inSeconds.toDouble()
                          : 0,
                      onChanged: (val) async {
                        await Global.playSong['player']
                            .seek(Duration(seconds: val.toInt()));
                      },
                    ),
                  ],
                );
              },
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  iconSize: 25,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.black.withOpacity(0.95),
                      shape: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          topLeft: Radius.circular(25),
                        ),
                      ),
                      builder: (context) {
                        return ListView.builder(
                          itemCount: Global.songs.length,
                          itemBuilder: (context, i) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 25),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.black),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 7),
                            child: Card(
                              color: Colors.transparent,
                              child: ListTile(
                                onTap: () {
                                  Navigator.of(context).pop();
                                  setState(() {
                                    Global.playSong["player"].pause();
                                    Global.index = i;
                                    Global.playSong = Global.songs[i];
                                  });
                                  Navigator.of(context)
                                      .pushReplacementNamed("player_page");
                                },
                                leading: Image.asset(
                                  "${Global.songs[i]["image"]}",
                                  width: 70,
                                ),
                                title: Text(
                                  "${Global.songs[i]["name"]}",
                                  style: TextStyle(
                                    color: (Global.songs[i] == Global.playSong)
                                        ? const Color(0xFF003B6A)
                                        : Colors.white,
                                  ),
                                ),
                                subtitle: Text(
                                  "${Global.songs[i]["sub"]}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.filter_list,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  iconSize: 35,
                  onPressed: () {
                    if (Global.index > 0) {
                      setState(() {
                        Global.playSong["player"].pause();
                        Global.index--;
                        Global.playSong = Global.songs[Global.index];
                      });
                      Navigator.of(context).pushReplacementNamed("player_page");
                      Global.playSong["player"].play();
                    }
                  },
                  icon: const Icon(Icons.skip_previous, color: Colors.white),
                ),
                IconButton(
                  // padding: EdgeInsets.all(10),
                  iconSize: 55,
                  icon: Icon(
                    (isPlay) ? Icons.pause : Icons.play_arrow,
                    color: Colors.black,
                  ),
                  onPressed: () async {
                    setState(() {
                      isPlay = (isPlay) ? false : true;
                    });
                    (isPlay)
                        ? await Global.playSong['player'].play()
                        : await Global.playSong['player'].pause();
                  },
                ),
                IconButton(
                  iconSize: 35,
                  onPressed: () {
                    if (Global.index < Global.songs.length - 1) {
                      setState(() {
                        Global.playSong["player"].pause();
                        Global.index++;
                        Global.playSong = Global.songs[Global.index];
                      });
                      Navigator.of(context).pushReplacementNamed("player_page");
                      Global.playSong["player"].play();
                    }
                  },
                  icon: const Icon(Icons.skip_next, color: Colors.white),
                ),
                IconButton(
                  iconSize: 25,
                  icon: const Icon(Icons.stop, color: Colors.black),
                  onPressed: () async {
                    setState(() {
                      isPlay = false;
                    });
                    await Global.playSong['player'].stop();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
