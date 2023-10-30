import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          "images/img_home.jpg",
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 400,
            ),
            ElevatedButton.icon(
              onPressed: () =>
                  Navigator.of(context).pushReplacementNamed("aslist_page"),
              label: const Text(
                "Hihaino",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 38
                ),
              ),
              icon: const Icon(
                  Icons.queue_music_outlined,
                  size: 40,
              ),
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Color(0xFF4D82D7),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
