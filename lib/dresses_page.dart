import 'package:flutter/material.dart';
import 'package:shoppa/dress_detail_page.dart';
import 'package:shoppa/model/dress.dart';

class DressesPage extends StatelessWidget {
  DressesPage({Key? key}) : super(key: key);
  final List<Dress> dresses = [
    Dress("Blue Dress", "This is a blue dress", "NGN 10000",
        "images/dark_lin.png"),
    Dress("Yellow Dress", "This is a blue dress", "NGN 10000",
        "images/skirt.png"),
    Dress("Green Dress", "This is a blue dress", "NGN 10000",
        "images/dark_lin.png"),
    Dress("Black Dress", "This is a blue dress", "NGN 10000",
        "images/long_white.png")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: dresses.length,
          itemBuilder: (BuildContext context, int index) {
            Dress dress = dresses[index];
            return _singleListItem(context, dress);
          }),
      appBar: AppBar(
        title: const Text("Dresses"),
      ),
    );
  }

  Widget _singleListItem(BuildContext context, Dress dress) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DressDetailPage(
                  dress: dress,
                )));
      },
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Image.asset(
          dress.imageName,
          fit: BoxFit.cover,
          width: 100,
          height: 120,
        ),
      ),
      subtitle: Text(dress.description),
      title: Text(dress.name),
    );
  }
}
