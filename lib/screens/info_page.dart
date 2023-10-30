import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  void launchFacebookPage() async {
    const facebookUrl = 'https://www.facebook.com/awrmalagasy';
    if (await canLaunch(facebookUrl)) {
      await launch(facebookUrl);
    } else {
      throw 'Impossible de lancer $facebookUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF031d38),
      appBar: AppBar(
        backgroundColor: const Color(0XFF063970),
        title: const Text(
          "Mikasika ny application",
          style: TextStyle(
            color: Color(0xFF4D82D7),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Ity application ity dia natao mba hanampy anao hahafantatra ireo fahamarinana ao anatin'ny Baiboly. amin'ny fomba mazava tsara. \n\n"
              "Ny AWR (Adventist World Radio) dia Radio advantista iraisam-pirenena mamokatra fandaharana mahakasika ny maha olona ny olona manontolo, "
              "amin'ny teninm-pirenena mihoatra ny 130.\n",
              style: TextStyle(color: Color(0xFFf7f1db), fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Raha misy fanontaniana:",
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                const Icon(
                  Icons.call,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 8,
                ),
                InkWell(
                  child: const Text(
                    "+261 34 06 097 62 (+WhatsApp)",
                    style: TextStyle(color: Color(0xFFf7f1db), fontSize: 16),
                  ),
                  onTap: () => launch("tel://+261 34 06 097 62"),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Icon(
                  Icons.call,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 8,
                ),
                InkWell(
                  child: const Text(
                    "+261 33 07 170 70",
                    style: TextStyle(color: Color(0xFFf7f1db), fontSize: 16),
                  ),
                  onTap: () => launch("tel://+261 34 06 097 62"),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Icon(
                  Icons.facebook,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 8,
                ),
                InkWell(
                  child: const Text(
                    "AWR Malagasy",
                    style: TextStyle(color: Color(0xFFf7f1db), fontSize: 16),
                  ),
                  onTap: () => launchFacebookPage(),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                Icon(
                  Icons.mail,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 8,
                ),
                InkWell(
                  child: Text(
                    "awrmalagasy@gmail.com",
                    style: TextStyle(color: Color(0xFFf7f1db), fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
