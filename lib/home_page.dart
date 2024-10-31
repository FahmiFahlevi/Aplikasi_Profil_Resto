import 'package:aplikasi_profil_resto/list_menu.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<MenuMakanan> _menu = MenuMakanan.listMenu;
  final String latitude = "-6.982562251141918";
  final String longitude = " 110.40903913895426";

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not launch $url";
    }
  }

  _launchEmail() async {
    launch("mailto:fahmifahlevi65@gmail.com?subject=Tanya Seputar Resto");
  }

  _launchMap() async {
    final String googleMapsUrl =
        "https://www.google.com/maps/search/?api=1&query$latitude,$longitude";
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw "Could not launch URL";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage("assets/image.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    _launchEmail();
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.email, size: 30),
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () => setState(() {
                    _makePhoneCall('tel:085159116193');
                  }),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.call, size: 30),
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    _launchMap();
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.location_on, size: 30),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              "Deskripsi : ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "RM Sedap Rasa adalah restoran yang menawarkan pengalaman kuliner yang menyenangkan dengan menu khas masakan Indonesia. Suasana di dalam restoran ini hangat dan ramah, menjadikannya tempat yang ideal untuk berkumpul bersama keluarga atau teman.",
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 10),
            const Text(
              "List Menu : ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _menu.length,
              itemBuilder: (context, index) {
                return _listMenu(
                    nama: _menu[index].nama, harga: _menu[index].harga);
              },
            ),
            const SizedBox(height: 10),
            const Text(
              "Alamat : ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Jl. Imam Bonjol No.207, Pendrikan Kidul, Kec. Semarang Tengah, Kota Semarang, Jawa Tengah 50131",
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 10),
            const Text(
              "Jam Buka : ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            _listBuka(hari: "Senin"),
            _listBuka(hari: "Selasa"),
            _listBuka(hari: "Rabu"),
            _listBuka(hari: "Kamis"),
            _listBuka(hari: "Jumat"),
            _listBuka(hari: "Sabtu"),
            _listBuka(hari: "Minggu"),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _listMenu({
    required String nama,
    required String harga,
  }) {
    return SizedBox(
      height: 30,
      child: Row(
        children: [
          const Icon(
            Icons.circle,
            size: 10,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(nama),
          ),
          Text(harga),
        ],
      ),
    );
  }

  Widget _listBuka({
    required String hari,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const Icon(
            Icons.circle,
            size: 10,
          ),
          const SizedBox(width: 10),
          Text("$hari : 10.00 - 22.00"),
        ],
      ),
    );
  }
}
